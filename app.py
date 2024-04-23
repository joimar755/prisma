from fastapi import FastAPI
from prisma import Prisma
from modelo.producto import products
from fastapi.middleware.cors import CORSMiddleware
import jwt 

app = FastAPI()
prisma = Prisma()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # En producción, especifica los dominios permitidos en lugar de "*"
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
async def get_user():
    async with Prisma() as db:
        data = await db.product.find_many()
    return data

@app.get("/{id}")
async def get_user(id :int):
    async with Prisma() as db:
        data = await db.product.find_first(
            where={"id":id},
            include={"category": True}
        )
    return data

@app.get("/api/{name}")
async def get_user(name :str):
    async with Prisma() as db:
        data = await db.product.find_first(
            where={"name":name},
            include={"category": True}
        )
       
    return data

@app.get("/data/relacion")
async def get_user():
    async with Prisma() as db:
        data = await db.product.find_many(
            # where={"id": id},
            include={"category": True, "detalles":True}
            
        )
    return data


@app.post("/api/insertar")
async def create_user(product :products):
    async with Prisma() as db:
        
        data = await db.product.create(
            data=product.model_dump()
        )
    return data
@app.put("/api/{id}")
async def update_products(id: int, product :products):
    async with Prisma() as db:
        data = await db.product.update(
            where={"id": id},
            data=product.model_dump()
        )
    return data

@app.delete("/api/{id}")
async def update_products(id: int):
    async with Prisma() as db:
        data = await db.product.delete(
            where={"id": id}
        )
    return data