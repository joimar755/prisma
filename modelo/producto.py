from pydantic import BaseModel

class products(BaseModel):
    name: str
    description: str
    price: int
    Stock: int
    category_id: int 
    