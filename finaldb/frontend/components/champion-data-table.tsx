"use client"

import { useState, useMemo } from "react"
import { Card } from "@/components/ui/card"
import { Button } from "@/components/ui/button"
import { ArrowUpDown, ArrowUp, ArrowDown } from "lucide-react"

// Datos de ejemplo de campeones de LoL
const championData = [
  { name: "Ahri", role: "Mage", winRate: 51.2, pickRate: 8.5, banRate: 3.2, games: 125000 },
  { name: "Yasuo", role: "Fighter", winRate: 49.8, pickRate: 12.3, banRate: 15.6, games: 180000 },
  { name: "Lux", role: "Mage", winRate: 52.1, pickRate: 9.8, banRate: 4.5, games: 145000 },
  { name: "Zed", role: "Assassin", winRate: 48.5, pickRate: 7.2, banRate: 12.3, games: 105000 },
  { name: "Jinx", role: "Marksman", winRate: 50.9, pickRate: 11.5, banRate: 2.8, games: 168000 },
  { name: "Thresh", role: "Support", winRate: 49.2, pickRate: 13.8, banRate: 8.9, games: 202000 },
  { name: "Lee Sin", role: "Fighter", winRate: 47.8, pickRate: 10.2, banRate: 6.7, games: 149000 },
  { name: "Ezreal", role: "Marksman", winRate: 48.9, pickRate: 15.6, banRate: 1.2, games: 228000 },
  { name: "Darius", role: "Fighter", winRate: 51.8, pickRate: 6.9, banRate: 18.4, games: 101000 },
  { name: "Lulu", role: "Support", winRate: 50.5, pickRate: 8.1, banRate: 5.6, games: 118000 },
]

type SortKey = "name" | "role" | "winRate" | "pickRate" | "banRate" | "games"
type SortDirection = "asc" | "desc" | null

export function ChampionDataTable() {
  const [sortKey, setSortKey] = useState<SortKey | null>(null)
  const [sortDirection, setSortDirection] = useState<SortDirection>(null)

  const handleSort = (key: SortKey) => {
    if (sortKey === key) {
      if (sortDirection === "asc") {
        setSortDirection("desc")
      } else if (sortDirection === "desc") {
        setSortDirection(null)
        setSortKey(null)
      } else {
        setSortDirection("asc")
      }
    } else {
      setSortKey(key)
      setSortDirection("asc")
    }
  }

  const sortedData = useMemo(() => {
    if (!sortKey || !sortDirection) return championData

    return [...championData].sort((a, b) => {
      const aValue = a[sortKey]
      const bValue = b[sortKey]

      if (typeof aValue === "string" && typeof bValue === "string") {
        return sortDirection === "asc" ? aValue.localeCompare(bValue) : bValue.localeCompare(aValue)
      }

      if (typeof aValue === "number" && typeof bValue === "number") {
        return sortDirection === "asc" ? aValue - bValue : bValue - aValue
      }

      return 0
    })
  }, [sortKey, sortDirection])

  const totals = useMemo(() => {
    return {
      count: championData.length,
      avgWinRate: (championData.reduce((sum, c) => sum + c.winRate, 0) / championData.length).toFixed(1),
      avgPickRate: (championData.reduce((sum, c) => sum + c.pickRate, 0) / championData.length).toFixed(1),
      avgBanRate: (championData.reduce((sum, c) => sum + c.banRate, 0) / championData.length).toFixed(1),
      totalGames: championData.reduce((sum, c) => sum + c.games, 0).toLocaleString(),
    }
  }, [])

  const getSortIcon = (key: SortKey) => {
    if (sortKey !== key) {
      return <ArrowUpDown className="h-4 w-4 opacity-50" />
    }
    if (sortDirection === "asc") {
      return <ArrowUp className="h-4 w-4 text-accent" />
    }
    if (sortDirection === "desc") {
      return <ArrowDown className="h-4 w-4 text-accent" />
    }
    return <ArrowUpDown className="h-4 w-4 opacity-50" />
  }

  return (
    <Card className="overflow-hidden border-border bg-card">
      <div className="overflow-x-auto">
        <table className="w-full">
          <thead>
            <tr className="border-b border-border bg-muted/50">
              <th className="px-6 py-4 text-left">
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => handleSort("name")}
                  className="h-auto p-0 font-semibold text-foreground hover:text-primary"
                >
                  Campeón
                  <span className="ml-2">{getSortIcon("name")}</span>
                </Button>
              </th>
              <th className="px-6 py-4 text-left">
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => handleSort("role")}
                  className="h-auto p-0 font-semibold text-foreground hover:text-primary"
                >
                  Rol
                  <span className="ml-2">{getSortIcon("role")}</span>
                </Button>
              </th>
              <th className="px-6 py-4 text-right">
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => handleSort("winRate")}
                  className="h-auto p-0 font-semibold text-foreground hover:text-primary"
                >
                  Win Rate %<span className="ml-2">{getSortIcon("winRate")}</span>
                </Button>
              </th>
              <th className="px-6 py-4 text-right">
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => handleSort("pickRate")}
                  className="h-auto p-0 font-semibold text-foreground hover:text-primary"
                >
                  Pick Rate %<span className="ml-2">{getSortIcon("pickRate")}</span>
                </Button>
              </th>
              <th className="px-6 py-4 text-right">
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => handleSort("banRate")}
                  className="h-auto p-0 font-semibold text-foreground hover:text-primary"
                >
                  Ban Rate %<span className="ml-2">{getSortIcon("banRate")}</span>
                </Button>
              </th>
              <th className="px-6 py-4 text-right">
                <Button
                  variant="ghost"
                  size="sm"
                  onClick={() => handleSort("games")}
                  className="h-auto p-0 font-semibold text-foreground hover:text-primary"
                >
                  Partidas
                  <span className="ml-2">{getSortIcon("games")}</span>
                </Button>
              </th>
            </tr>
          </thead>
          <tbody>
            {sortedData.map((champion, index) => (
              <tr key={champion.name} className="border-b border-border transition-colors hover:bg-muted/30">
                <td className="px-6 py-4 font-medium text-foreground">{champion.name}</td>
                <td className="px-6 py-4">
                  <span className="inline-flex items-center rounded-md bg-secondary px-2.5 py-0.5 text-xs font-medium text-secondary-foreground">
                    {champion.role}
                  </span>
                </td>
                <td className="px-6 py-4 text-right font-mono text-foreground">
                  <span className={champion.winRate >= 50 ? "text-chart-3" : "text-chart-5"}>{champion.winRate}%</span>
                </td>
                <td className="px-6 py-4 text-right font-mono text-foreground">{champion.pickRate}%</td>
                <td className="px-6 py-4 text-right font-mono text-foreground">{champion.banRate}%</td>
                <td className="px-6 py-4 text-right font-mono text-foreground">{champion.games.toLocaleString()}</td>
              </tr>
            ))}
          </tbody>
          <tfoot>
            <tr className="border-t-2 border-primary/20 bg-muted/70 font-semibold">
              <td className="px-6 py-4 text-foreground">Total: {totals.count} campeones</td>
              <td className="px-6 py-4 text-muted-foreground">—</td>
              <td className="px-6 py-4 text-right font-mono text-primary">Promedio: {totals.avgWinRate}%</td>
              <td className="px-6 py-4 text-right font-mono text-primary">Promedio: {totals.avgPickRate}%</td>
              <td className="px-6 py-4 text-right font-mono text-primary">Promedio: {totals.avgBanRate}%</td>
              <td className="px-6 py-4 text-right font-mono text-primary">Total: {totals.totalGames}</td>
            </tr>
          </tfoot>
        </table>
      </div>
    </Card>
  )
}
