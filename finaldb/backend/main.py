from typing import Union
from db import obtener_conexion
from fastapi.middleware.cors import CORSMiddleware


from fastapi import FastAPI

app = FastAPI()

origins = [
    "http://localhost:5173",  # frontend local
    "http://127.0.0.1:5173",
]

# 🔹 Agregar el middleware CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,          # o ["*"] para permitir todos los orígenes (no recomendado en producción)
    allow_credentials=True,
    allow_methods=["*"],            # permitir todos los métodos: GET, POST, etc.
    allow_headers=["*"],            # permitir todos los headers
)

@app.get("/difficulty")
def difficulty():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    sql = "SELECT * FROM difficulty"
    cursor.execute(sql)
    dificultades = cursor.fetchall()
    conexion.commit()
    return {"Hello": "World", "dificultades": dificultades}

@app.get("/champions")
def champions():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    sql = "SELECT champ_name FROM champion"
    cursor.execute(sql)
    champions = cursor.fetchall()
    conexion.commit()
    return {"Hello": "World", "dificultades": champions}

@app.get("/champions_by_asc")
def champions_by_asc():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    sql = "SELECT * FROM champion ORDER BY champ_name ASC"
    cursor.execute(sql)
    champions_by_asc = cursor.fetchall()
    conexion.commit()
    return {"Hello": "World", "dificultades": champions_by_asc}

@app.get("/champions_by_desc")
def champions_by_asc():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    sql = "SELECT champ_name FROM champion ORDER BY champ_name DESC"
    cursor.execute(sql)
    champions_by_desc = cursor.fetchall()
    conexion.commit()
    return {"Hello": "World", "dificultades": champions_by_desc}

@app.get("/championclass")
def championclass():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    sql = "SELECT * FROM championclass"
    cursor.execute(sql)
    championclass = cursor.fetchall()
    conexion.commit()
    return {"Hello": "World", "dificultades": championclass}

@app.get("/championrole")
def championrole():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    sql = "SELECT * FROM championrole"
    cursor.execute(sql)
    championrole = cursor.fetchall()
    conexion.commit()
    return {"Hello": "World", "dificultades": championrole}

@app.get("/class")
def champclass():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    sql = "SELECT * FROM class"
    cursor.execute(sql)
    champclass = cursor.fetchall()
    conexion.commit()
    return {"Hello": "World", "dificultades": champclass}

@app.get("/rangetype")
def rangetype():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    sql = "SELECT * FROM rangetype"
    cursor.execute(sql)
    rangetype = cursor.fetchall()
    conexion.commit()
    return {"Hello": "World", "dificultades": rangetype}

@app.get("/resourcetype")
def resourcetype():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    sql = "SELECT * FROM resourcetype"
    cursor.execute(sql)
    resourcetype = cursor.fetchall()
    conexion.commit()
    return {"resourcetype": resourcetype}

@app.get("/roles")
def roles():
    conexion = obtener_conexion()
    cursor = conexion.cursor()
    sql = "SELECT * FROM roles"
    cursor.execute(sql)
    roles = cursor.fetchall()
    conexion.commit()
    return {"Hello": "World", "dificultades": roles}

