from fastapi import FastAPI
from prisma import Prisma
from modelo.producto import products

app = FastAPI()
prisma = Prisma()


@app.get("/")
async def get_user():
    async with Prisma() as db:
        data = await db.product.find_many()
    return data


@app.get("/relacion")
async def get_user():
    async with Prisma() as db:
        data = await db.product.find_many(
            # where={"id": id},
            include={"category": True, "detalles":True}
            
        )
    return data


@app.post("/insertar")
async def create_user(product :products):
    async with Prisma() as db:
        
        data = await db.product.create(
            data=product.model_dump()
        )
    return data
