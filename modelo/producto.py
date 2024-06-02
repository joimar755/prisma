from typing import Optional
from pydantic import BaseModel, Field

class products(BaseModel):
    name:  Optional[str]
    description:  Optional[str]
    price: int
    Stock: int
    category_id: int 
    
    
