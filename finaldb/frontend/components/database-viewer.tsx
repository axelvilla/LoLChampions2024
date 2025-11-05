"use client"

import { useState, useEffect } from "react"
import { Card } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { Input } from "@/components/ui/input"
import { Textarea } from "@/components/ui/textarea"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"
import { Badge } from "@/components/ui/badge"
import { Alert, AlertDescription } from "@/components/ui/alert"
import { Loader2, Database, Play, Table, Info, AlertCircle } from "lucide-react"

interface TableInfo {
  name: string
  columns: Array<{
    name: string
    type: string
    null: string
    key: string
  }>
  row_count: number
}

interface QueryResult {
  success: boolean
  columns: string[]
  data: any[][]
  row_count: number
}

interface ChampionsData {
  success: boolean
  columns: string[]
  data: any[][]
  row_count: number
}

export function DatabaseViewer() {
  const [tablesInfo, setTablesInfo] = useState<TableInfo[]>([])
  const [championsData, setChampionsData] = useState<ChampionsData | null>(null)
  const [queryResult, setQueryResult] = useState<QueryResult | null>(null)
  const [sqlQuery, setSqlQuery] = useState("")
  const [loading, setLoading] = useState(false)
  const [error, setError] = useState("")
  const [activeTab, setActiveTab] = useState("champions")

  const predefinedQueries = [
    {
      name: "Análisis de Distribución por Complejidad",
      query: "SELECT d.descrip AS Dificultad, COUNT(*) AS Cantidad_Campeones FROM champion c JOIN difficulty d ON c.difficulty_id = d.difficulty_id GROUP BY d.descrip ORDER BY Cantidad_Campeones DESC"
    },
    {
      name: "Clasificación por Sistema de Recursos",
      query: "SELECT rt.descrip AS Tipo_Recurso, COUNT(*) AS Cantidad_Campeones FROM champion c JOIN resourcetype rt ON c.resource_type_id = rt.resource_type_id GROUP BY rt.descrip ORDER BY Cantidad_Campeones DESC"
    },
    {
      name: "Distribución por Alcance de Combate",
      query: "SELECT rt.descrip AS Tipo_Rango, COUNT(*) AS Cantidad_Campeones FROM champion c JOIN rangetype rt ON c.range_type_id = rt.range_type_id GROUP BY rt.descrip"
    },
    {
      name: "Ranking de Resistencia Base",
      query: "SELECT champ_name AS Nombre, nickname AS Apodo, base_hp AS HP_Base FROM champion ORDER BY base_hp DESC LIMIT 10"
    },
    {
      name: "Evolución Temporal de Lanzamientos",
      query: "SELECT YEAR(release_date) AS Año, COUNT(*) AS Campeones_Lanzados FROM champion WHERE release_date IS NOT NULL GROUP BY YEAR(release_date) ORDER BY Año"
    },
    {
      name: "Análisis de Posiciones de Juego",
      query: "SELECT r.descrip AS Rol, COUNT(cr.champion_id) AS Cantidad_Campeones FROM roles r LEFT JOIN championrole cr ON r.roles_id = cr.role_id GROUP BY r.descrip ORDER BY Cantidad_Campeones DESC"
    },
    {
      name: "Categorización por Especialización",
      query: "SELECT c.descrip AS Clase, COUNT(cc.champion_id) AS Cantidad_Campeones FROM class c LEFT JOIN championclass cc ON c.class_id = cc.class_id GROUP BY c.descrip ORDER BY Cantidad_Campeones DESC"
    },
    {
      name: "Ranking de Costos en Moneda Virtual",
      query: "SELECT champ_name AS Nombre, blue_essence AS Blue_Essence, rp AS RP FROM champion ORDER BY blue_essence DESC LIMIT 10"
    },
    {
      name: "Campeones de Última Generación",
      query: "SELECT champ_name AS Nombre, nickname AS Apodo, release_date AS Fecha_Lanzamiento FROM champion WHERE YEAR(release_date) = 2024 ORDER BY release_date"
    },
    {
      name: "Métricas Agregadas por Nivel de Dificultad",
      query: "SELECT d.descrip AS Dificultad, COUNT(*) AS Total_Campeones, AVG(c.base_hp) AS HP_Promedio, AVG(c.base_mana) AS Mana_Promedio, AVG(c.blue_essence) AS Blue_Essence_Promedio FROM champion c JOIN difficulty d ON c.difficulty_id = d.difficulty_id GROUP BY d.descrip ORDER BY Total_Campeones DESC"
    }
  ]

  useEffect(() => {
    loadTablesInfo()
    loadChampionsData()
  }, [])

  const loadTablesInfo = async () => {
    try {
      setLoading(true)
      const response = await fetch('http://localhost:8000/tables-info')
      const data = await response.json()
      setTablesInfo(data.tables)
    } catch (err) {
      setError("Error cargando información de tablas")
    } finally {
      setLoading(false)
    }
  }

  const loadChampionsData = async () => {
    try {
      setLoading(true)
      const response = await fetch('http://localhost:8000/champions-complete')
      const data = await response.json()
      setChampionsData(data)
    } catch (err) {
      setError("Error cargando datos de campeones")
    } finally {
      setLoading(false)
    }
  }

  const executeQuery = async () => {
    if (!sqlQuery.trim()) {
      setError("Por favor ingresa una consulta SQL")
      return
    }

    try {
      setLoading(true)
      setError("")
      const response = await fetch('http://localhost:8000/execute-query', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
        },
        body: JSON.stringify({ query: sqlQuery }),
      })

      const data = await response.json()
      
      if (data.success) {
        setQueryResult(data)
        setActiveTab("results")
      } else {
        setError(data.detail || "Error ejecutando consulta")
      }
    } catch (err) {
      setError("Error de conexión con el servidor")
    } finally {
      setLoading(false)
    }
  }

  const loadPredefinedQuery = (query: string) => {
    setSqlQuery(query)
  }

  const renderTable = (data: any[][], columns: string[], title: string) => {
    if (!data || data.length === 0) {
      return (
        <div className="text-center py-8 text-muted-foreground">
          No hay datos para mostrar
        </div>
      )
    }

    return (
      <div className="overflow-x-auto">
        <div className="mb-4 flex items-center gap-2">
          <Table className="h-5 w-5" />
          <h3 className="text-lg font-semibold">{title}</h3>
          <Badge variant="secondary">{data.length} filas</Badge>
        </div>
        <table className="w-full border-collapse">
          <thead>
            <tr className="border-b bg-muted/50">
              {columns.map((column, index) => (
                <th key={index} className="px-4 py-3 text-left font-semibold">
                  {column}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {data.map((row, rowIndex) => (
              <tr key={rowIndex} className="border-b hover:bg-muted/30">
                {row.map((cell, cellIndex) => (
                  <td key={cellIndex} className="px-4 py-3">
                    {cell === null ? (
                      <span className="text-muted-foreground italic">NULL</span>
                    ) : (
                      String(cell)
                    )}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <div className="flex items-center gap-2">
        <Database className="h-6 w-6" />
        <h2 className="text-2xl font-bold">Visualizador de Base de Datos</h2>
      </div>

      {error && (
        <Alert variant="destructive">
          <AlertCircle className="h-4 w-4" />
          <AlertDescription>{error}</AlertDescription>
        </Alert>
      )}

      <Tabs value={activeTab} onValueChange={setActiveTab} className="space-y-4">
        <TabsList className="grid w-full grid-cols-4">
          <TabsTrigger value="champions">Campeones</TabsTrigger>
          <TabsTrigger value="tables">Tablas</TabsTrigger>
          <TabsTrigger value="query">Consultas SQL</TabsTrigger>
          <TabsTrigger value="results">Resultados</TabsTrigger>
        </TabsList>

        <TabsContent value="champions" className="space-y-4">
          <Card className="p-6">
            <div className="flex items-center gap-2 mb-4">
              <Info className="h-5 w-5" />
              <h3 className="text-lg font-semibold">Datos de Campeones</h3>
            </div>
            {loading ? (
              <div className="flex items-center justify-center py-8">
                <Loader2 className="h-6 w-6 animate-spin" />
                <span className="ml-2">Cargando datos...</span>
              </div>
            ) : championsData ? (
              renderTable(
                championsData.data,
                championsData.columns,
                `Campeones (${championsData.row_count} registros)`
              )
            ) : (
              <div className="text-center py-8 text-muted-foreground">
                No se pudieron cargar los datos
              </div>
            )}
          </Card>
        </TabsContent>

        <TabsContent value="tables" className="space-y-4">
          <Card className="p-6">
            <div className="flex items-center gap-2 mb-4">
              <Table className="h-5 w-5" />
              <h3 className="text-lg font-semibold">Información de Tablas</h3>
            </div>
            {loading ? (
              <div className="flex items-center justify-center py-8">
                <Loader2 className="h-6 w-6 animate-spin" />
                <span className="ml-2">Cargando información...</span>
              </div>
            ) : (
              <div className="space-y-4">
                {tablesInfo.map((table) => (
                  <Card key={table.name} className="p-4">
                    <div className="flex items-center justify-between mb-2">
                      <h4 className="font-semibold text-lg">{table.name}</h4>
                      <Badge variant="outline">{table.row_count} registros</Badge>
                    </div>
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-2">
                      {table.columns.map((column, index) => (
                        <div key={index} className="text-sm">
                          <span className="font-medium">{column.name}</span>
                          <span className="text-muted-foreground ml-2">
                            ({column.type})
                          </span>
                          
                        </div>
                      ))}
                    </div>
                  </Card>
                ))}
              </div>
            )}
          </Card>
        </TabsContent>

        <TabsContent value="query" className="space-y-4">
          <Card className="p-6">
            <div className="flex items-center gap-2 mb-4">
              <Play className="h-5 w-5" />
              <h3 className="text-lg font-semibold">Consultas SQL</h3>
            </div>
            
            
            <div className="space-y-4">
              <div>
                <label className="text-sm font-medium mb-2 block">
                  Consultas Predefinidas del README
                </label>
                <div className="grid grid-cols-1 gap-2 max-h-96 overflow-y-auto">
                  {predefinedQueries.map((query, index) => (
                    <Button
                      key={index}
                      variant="outline"
                      size="sm"
                      onClick={() => loadPredefinedQuery(query.query)}
                      className="justify-start text-left h-auto p-3 hover:bg-accent"
                    >
                      <div className="w-full">
                        <div className="font-medium text-sm">{query.name}</div>
                        <div className="text-xs text-muted-foreground mt-1 font-mono">
                          {query.query.substring(0, 80)}...
                        </div>
                      </div>
                    </Button>
                  ))}
                </div>
              </div>

              <div>
                <label className="text-sm font-medium mb-2 block">
                  Consulta SQL Personalizada
                </label>
                <Textarea
                  value={sqlQuery}
                  onChange={(e) => setSqlQuery(e.target.value)}
                  placeholder="Escribe tu consulta SQL aquí..."
                  className="min-h-[120px] font-mono text-sm"
                />
              </div>

              <Button 
                onClick={executeQuery} 
                disabled={loading || !sqlQuery.trim()}
                className="w-full"
              >
                {loading ? (
                  <>
                    <Loader2 className="h-4 w-4 animate-spin mr-2" />
                    Ejecutando...
                  </>
                ) : (
                  <>
                    <Play className="h-4 w-4 mr-2" />
                    Ejecutar Consulta
                  </>
                )}
              </Button>
            </div>
          </Card>
        </TabsContent>

        <TabsContent value="results" className="space-y-4">
          <Card className="p-6">
            <div className="flex items-center gap-2 mb-4">
              <Table className="h-5 w-5" />
              <h3 className="text-lg font-semibold">Resultados de Consulta</h3>
            </div>
            {queryResult ? (
              renderTable(
                queryResult.data,
                queryResult.columns,
                `Resultados (${queryResult.row_count} filas)`
              )
            ) : (
              <div className="text-center py-8 text-muted-foreground">
                Ejecuta una consulta para ver los resultados aquí
              </div>
            )}
          </Card>
        </TabsContent>
      </Tabs>
    </div>
  )
}
