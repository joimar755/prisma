from typing import List, Optional
from pydantic import BaseModel, Field


class Detalle(BaseModel):
    cantidad: float
    Subtotal: float
    product_id: int
