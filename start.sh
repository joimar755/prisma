#!/bin/bash

# Ejecutar prisma db push para sincronizar la base de datos
npx prisma db push

# Iniciar la aplicación FastAPI
uvicorn app:app --reload --host 0.0.0.0 --port 8000
