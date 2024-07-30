from typing import List, Optional
from pydantic import BaseModel, Field
from modelo.Detalle import Detalle
class Venta(BaseModel):
    items: List[Detalle]
    total: float