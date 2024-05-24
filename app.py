from datetime import timedelta
from typing import Annotated

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
        'http://localhost:3000'
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
                return(jsonable_encoder({"error":"users with this name already exists"}))
            
            existing_email = await db.users.find_unique(where={"email": user.email})
            if existing_email:
                return(jsonable_encoder({"error":"email with this name already exists"}))
                
            hashed_password = pwd_context.hash(user.password)

            data = await db.users.create(
                data={
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
                    "detalles": result.detalles,
                }
            )
        data = payload
        ##print(payload)
    return data


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
