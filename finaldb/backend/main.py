from typing import Union
from db import obtener_conexion
from fastapi.middleware.cors import CORSMiddleware
from pydantic import BaseModel
from fastapi import FastAPI, HTTPException

app = FastAPI(
    title="League of Legends Database API",
    description="API para visualizar datos de campeones de League of Legends",
    version="1.0.0"
)

origins = [
    "http://localhost:3000",  
    "http://localhost:5173",  
    "http://127.0.0.1:3000",
    "http://127.0.0.1:5173",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,          
    allow_credentials=True,
    allow_methods=["*"],            
    allow_headers=["*"],           
)

@app.get("/")
def root():
    return {
        "message": "League of Legends Database API",
        "version": "1.0.0",
        "status": "running",
        "endpoints": {
            "champions": "/champions-complete",
            "tables": "/tables-info",
            "query": "/execute-query",
            "docs": "/docs"
        }
    }

@app.get("/health")
def health_check():
    try:
        # Verificar conexión a la base de datos
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        cursor.execute("SELECT 1")
        cursor.fetchone()
        conexion.close()
        
        return {
            "status": "healthy",
            "database": "connected",
            "timestamp": "2024-01-01T00:00:00Z"
        }
    except Exception as e:
        return {
            "status": "unhealthy",
            "database": "disconnected",
            "error": str(e),
            "timestamp": "2024-01-01T00:00:00Z"
        }

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

# Modelo para consultas SQL personalizadas
class SQLQuery(BaseModel):
    query: str

@app.post("/execute-query")
def execute_query(sql_query: SQLQuery):
    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        
        # Validar que la consulta no sea peligrosa
        query_lower = sql_query.query.lower().strip()
        dangerous_keywords = ['drop', 'delete', 'update', 'insert', 'alter', 'create', 'truncate']
        
        if any(keyword in query_lower for keyword in dangerous_keywords):
            raise HTTPException(status_code=400, detail="Consultas de modificación no permitidas")
        
        cursor.execute(sql_query.query)
        results = cursor.fetchall()
        
        columns = [desc[0] for desc in cursor.description] if cursor.description else []
        
        conexion.close()
        
        return {
            "success": True,
            "columns": columns,
            "data": results,
            "row_count": len(results)
        }
    except Exception as e:
        raise HTTPException(status_code=400, detail=f"Error ejecutando consulta: {str(e)}")

# Endpoint para obtener información de las tablas
@app.get("/tables-info")
def get_tables_info():
    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        
        # Obtener lista de tablas
        cursor.execute("SHOW TABLES")
        tables = cursor.fetchall()
        
        tables_info = []
        for table in tables:
            table_name = table[0]
            
            # Obtener información de columnas
            cursor.execute(f"DESCRIBE {table_name}")
            columns = cursor.fetchall()
            
            # Obtener conteo de registros
            cursor.execute(f"SELECT COUNT(*) FROM {table_name}")
            count = cursor.fetchone()[0]
            
            tables_info.append({
                "name": table_name,
                "columns": [{"name": col[0], "type": col[1], "null": col[2], "key": col[3]} for col in columns],
                "row_count": count
            })
        
        conexion.close()
        return {"tables": tables_info}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error obteniendo información de tablas: {str(e)}")

# Endpoint para obtener campeones con información completa
@app.get("/champions-complete")
def champions_complete():
    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        
        sql = """
        SELECT 
            c.champion_id,
            c.champ_name,
            c.nickname,
            c.release_date,
            c.last_changed,
            c.blue_essence,
            c.rp,
            d.descrip as difficulty,
            rt.descrip as range_type,
            rst.descrip as resource_type,
            c.base_hp,
            c.base_mana
        FROM champion c
        LEFT JOIN difficulty d ON c.difficulty_id = d.difficulty_id
        LEFT JOIN rangetype rt ON c.range_type_id = rt.range_type_id
        LEFT JOIN resourcetype rst ON c.resource_type_id = rst.resource_type_id
        ORDER BY c.champ_name
        """
        
        cursor.execute(sql)
        champions = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        
        conexion.close()
        
        return {
            "success": True,
            "columns": columns,
            "data": champions,
            "row_count": len(champions)
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error obteniendo campeones: {str(e)}")

# Endpoint para obtener clases de campeones
@app.get("/champions-with-classes")
def champions_with_classes():
    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        
        sql = """
        SELECT 
            c.champ_name,
            GROUP_CONCAT(cl.descrip SEPARATOR ', ') as classes
        FROM champion c
        LEFT JOIN championclass cc ON c.champion_id = cc.champion_id
        LEFT JOIN class cl ON cc.class_id = cl.class_id
        GROUP BY c.champion_id, c.champ_name
        ORDER BY c.champ_name
        """
        
        cursor.execute(sql)
        champions = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        
        conexion.close()
        
        return {
            "success": True,
            "columns": columns,
            "data": champions,
            "row_count": len(champions)
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error obteniendo campeones con clases: {str(e)}")

# Endpoint para obtener roles de campeones
@app.get("/champions-with-roles")
def champions_with_roles():
    try:
        conexion = obtener_conexion()
        cursor = conexion.cursor()
        
        sql = """
        SELECT 
            c.champ_name,
            GROUP_CONCAT(r.descrip SEPARATOR ', ') as roles
        FROM champion c
        LEFT JOIN championrole cr ON c.champion_id = cr.champion_id
        LEFT JOIN roles r ON cr.role_id = r.roles_id
        GROUP BY c.champion_id, c.champ_name
        ORDER BY c.champ_name
        """
        
        cursor.execute(sql)
        champions = cursor.fetchall()
        columns = [desc[0] for desc in cursor.description]
        
        conexion.close()
        
        return {
            "success": True,
            "columns": columns,
            "data": champions,
            "row_count": len(champions)
        }
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error obteniendo campeones con roles: {str(e)}")

