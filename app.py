from datetime import date, datetime, timedelta
from typing import Annotated
from modelo.Detalle import Detalle
from modelo.Venta import Venta
from fastapi import FastAPI
from fastapi.responses import JSONResponse
from fastapi.security import OAuth2PasswordRequestForm
from modelo.token import ACCESS_TOKEN_EXPIRE_MINUTES , create_access_token
from fastapi import Depends, FastAPI,  HTTPException, status
from modelo.oauth import get_current_user
from fastapi.encoders import jsonable_encoder
from prisma import Prisma
import requests
from modelo.producto import products
from modelo.user import Token, Users, Login
from fastapi.middleware.cors import CORSMiddleware
from passlib.context import CryptContext
from dotenv import load_dotenv
import os
load_dotenv()

database_url = os.getenv("DATABASE_URL")
secret_key = os.getenv("SECRET_KEY")


def Dolar():
    api_key = 'tu_clave_de_API'
    base_currency = 'USD'
    target_currency = 'COP'
    url = f'https://open.er-api.com/v6/latest/{base_currency}?api_key={api_key}'

    response = requests.get(url)
    data = response.json()
    exchange_rate = float(data['rates'][target_currency])
    rounds = round(exchange_rate, 2)
    ##print(exchange_rate)
    return rounds


pwd_context = CryptContext(schemes=["bcrypt"], deprecated="auto")


app = FastAPI()
prisma = Prisma()

app.add_middleware(
    CORSMiddleware,
    allow_origins=[
       "*"
    ],  # En producción, especifica los dominios permitidos en lugar de "*"
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)



    
@app.get("/")
async def get_user(current_user: Users = Depends(get_current_user)):
    async with Prisma() as db:
        data = await db.product.find_many()
    return {"resultado":data}
@app.get("/dolar")
async def get_user():
    data = Dolar()
    print(data)
    return {"resultado":data}
@app.get("/category")
async def get_user():
    async with Prisma() as db:
        data = await db.category.find_many()
    return {"resultado":data}
@app.post("/api/user/registrar")
async def register(user:Users):
    try:
      async with Prisma() as db:
            # Verificar si ya existe un producto con el mismo nombre
            existing_product = await db.users.find_unique(where={"name": user.name})
            if existing_product:
                return JSONResponse("users with this name already exists")
                return(jsonable_encoder({"error":"users with this name already exists"}))
            
            existing_email = await db.users.find_unique(where={"email": user.email})
            if existing_email:
                return JSONResponse("email with this name already exists")
                
            hashed_password = pwd_context.hash(user.password)

            data = await db.users.create(
                {
                "name": user.name,
                "email": user.email,
                "password": hashed_password
                }
            )
            return {"message": "users agregado exitosamente", "data": data}
    except Exception as error:
        raise HTTPException(status_code=500, detail=str(error))
@app.post("/api/login/login", response_model=Token)
async def login(user: OAuth2PasswordRequestForm = Depends()):
    try:
        async with Prisma() as db:
        # Buscar al usuario por nombre
         user_db = await db.users.find_first(where={"name": user.username})
        if not user_db or not pwd_context.verify(user.password, user_db.password):
            return JSONResponse("Incorrect username or password")

        access_token = create_access_token(
         data={"sub": user_db.name}
          )
        token = {"access_token":access_token, "token_type":"bearer"}
        return JSONResponse(token)
    
        #return {"message": "Logged in successfully"}
    except Exception as error:
        raise HTTPException(status_code=500, detail=str(error))

    
    
@app.get("/api/{id}")
async def get_user(id: int):
    async with Prisma() as db:
        data = await db.product.find_first(where={"id": id}, include={"category": True})
    return data


@app.get("/api/nombre/{name}")
async def get_user(name: str):
    async with Prisma() as db:
        data = await db.product.find_first(
            where={"name": name}, include={"category": True}
        )

    return data


@app.get("/relacion")
async def get_user():
    async with Prisma() as db:
        data = await db.product.find_many(
            # where={"id": id},
            include={"category": True, "detalles": True}
        )
        print(len(data))
        payload = []
        for result in data:
            payload.append(
                {
                    "id": result.id,
                    "name": result.name,
                    "price": result.price,
                    "Stock": result.Stock,
                    "category": result.category.name if result.category else None,
                    "detalles": result.detalles
                }
            )
        data = payload
        ##print(payload)
    return data
@app.get("/venta/{id}")
async def get_user(id:int):
    async with Prisma() as db:
        data = await db.venta.find_many(
            where={"id": id},
            include={"detalles":{
                "include":{
                    "product":True
                }
            }
            }
        )
        print(len(data))
        payload = []
        for result in data:
            #detalles = []
             for detalle in result.detalles:
              payload.append(
                {
                    "id": result.id,
                    "total": result.total,
                    "date_time":result.createdAt,
                    "detalles":[
                        {
                          "cantidad": detalle.cantidad,
                          "price": detalle.product.price,
                          "producto_name":detalle.product.name,
                        }
                    ]
                }
            )
        data = payload
        ##print(payload)
    return data

@app.get("/venta")
async def get_user():
    async with Prisma() as db:
        data = await db.venta.find_many()
    return data

@app.get("/total-diario")
async def obtener_total_diario():
    # Filtra las ventas por la fecha
    async with Prisma() as db:
      result = await db.query_raw(
        """
        SELECT DATE(createdAt) AS fecha, SUM(total) AS total_diario
        FROM venta
        GROUP BY DATE(createdAt)
        ORDER BY DATE(fecha)
        """
    )

    # Cierra la conexión a la base de datos
    await db.disconnect()

    # Estructura el resultado
    payload = [
        {
            "fecha": results["fecha"],
            "total": results["total_diario"]
        }
        for results in result
    ]

    return payload



@app.post("/datos/insertar")
async def create_Products(product: products,):
    try:
        async with Prisma() as db:
            # Verificar si ya existe un producto con el mismo nombre
            existing_product = await db.product.find_unique(where={"name": product.name})
            if existing_product:
                return(jsonable_encoder({"error":"Product with this name already exists"}))
            data = await db.product.create(data=product.model_dump())
            return {"message": "Producto agregado exitosamente", "data": data}

    except HTTPException as error_http:
        raise error_http
    except Exception as error:
        raise HTTPException(status_code=500, detail=str(error))

@app.post("/datos/comprar")
async def create_Products(compra: Venta,):
    try:
        async with Prisma() as db:
            nueva_venta = await db.venta.create(
            data={
                'total': compra.total,
                'detalles':{
                    'create':[
                       {
                         'product_id':item.product_id,
                         'Subtotal':item.Subtotal,
                         'cantidad':item.cantidad
                       }for item in compra.items
                    ]
                 }
                }
            )
            return {"message": "venta agregado exitosamente", "data":nueva_venta}

    except HTTPException as error_http:
        raise error_http
    except Exception as error:
        raise HTTPException(status_code=500, detail=str(error))

@app.put("/api/{id}")
async def update_products(id: int, product: products):
    async with Prisma() as db:
        data = await db.product.update(where={"id": id}, data=product.model_dump())
    return data


@app.delete("/api/{id}")
async def update_products(id: int):
    async with Prisma() as db:
        data = await db.product.delete(where={"id": id})
        
    return {"message":"producto eliminado","data":data}
