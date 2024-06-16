from typing import List, Optional
from pydantic import BaseModel, Field


class Detalle(BaseModel):
    cantidad: int
    Subtotal: float
    product_id: int
