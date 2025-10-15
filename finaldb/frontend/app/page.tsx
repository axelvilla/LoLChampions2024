import { ChampionDataTable } from "@/components/champion-data-table"

export default function Home() {
  return (
    <main className="min-h-screen bg-background p-6 md:p-12">
      <div className="mx-auto max-w-7xl space-y-8">
        <div className="space-y-2">
          <h1 className="text-4xl font-bold tracking-tight text-foreground">League of Legends Champions</h1>
          <p className="text-muted-foreground text-balance">
            Visualizador de estadísticas de campeones con ordenamiento y totales
          </p>
        </div>

        <ChampionDataTable />
      </div>
    </main>
  )
}
