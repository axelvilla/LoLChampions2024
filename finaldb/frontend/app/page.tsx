import { DatabaseViewer } from "@/components/database-viewer"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"

export default function Home() {
  return (
    <main className="min-h-screen bg-background p-6 md:p-12">
      <div className="mx-auto max-w-7xl space-y-8">
        <div className="space-y-2">
          <h1 className="text-4xl font-bold tracking-tight text-foreground">League of Legends Database</h1>
          <p className="text-muted-foreground text-balance">
            Visualizador de base de datos y consultas SQL para campeones de League of Legends
          </p>
        </div>

        <Tabs defaultValue="database" className="space-y-6">
          
          
          <TabsContent value="database">
            <DatabaseViewer />
          </TabsContent>
          
          
        </Tabs>
      </div>
    </main>
  )
}
