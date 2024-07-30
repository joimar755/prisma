# Utilizar múltiples etapas para separar la construcción de Node.js y Python
# Etapa 1: Instalación de dependencias de Node.js y generación de Prisma
FROM node:19-slim AS node_build

WORKDIR /app

# Copiar los archivos de configuración de npm
COPY package*.json ./

# Instalar dependencias de npm, incluyendo Prisma

# Etapa 2: Instalación de dependencias de Python y ejecución de la aplicación
FROM python:3.10-slim

# Establecer variables de entorno
ENV PYTHONUNBUFFERED=1
ENV PIP_DISABLE_PIP_VERSION_CHECK=1

WORKDIR /code

# Copiar y configurar el entorno virtual de Python
COPY requirements.txt .

RUN python -m venv venv \
    && /bin/bash -c "source venv/bin/activate && pip install -r requirements.txt"

RUN pip install fastapi
RUN pip install python-jose 
RUN pip install prisma
RUN pip install passlib
RUN pip install pydantic
RUN pip install requests



RUN python -m venv venv

RUN /bin/bash -c "source venv/bin/activate && pip install -r requirements.txt"

RUN /bin/bash -c "source venv/bin/activate && pip install 'uvicorn[standard]'"


# Copiar el código de la aplicación
COPY . .
COPY .env /app/
RUN /bin/bash -c "source venv/bin/activate && pip install python-jose "
RUN prisma generate
#RUN prisma db push



# Exponer el puerto donde se ejecuta la aplicación
EXPOSE 8000

# Comando para ejecutar la aplicación FastAPI
CMD ["uvicorn", "app:app", "--reload", "--host", "0.0.0.0", "--port", "8000"]
