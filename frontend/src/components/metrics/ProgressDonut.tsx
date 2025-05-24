"use client";

import { PieChart, Pie, Cell, Tooltip, ResponsiveContainer } from "recharts";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { ProgressDonutType } from "@/types/data";

const COLORS = [
  "hsl(var(--progress-complete))",
  "hsl(var(--progress-remaining))",
];

export default function ProgressDonut({ data }: { data: ProgressDonutType[] }) {
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4">
      {data.map((el, index) => (
        <Card key={index} className="min-w-[400px]">
          <CardHeader>
            <CardTitle className="text-base font-medium">
              Course: {el.courseName}
            </CardTitle>
          </CardHeader>
          <CardContent>
            <ResponsiveContainer width="100%" height={200}>
              <PieChart>
                <Pie
                  data={el.chart}
                  dataKey="remaining"
                  nameKey="status"
                  innerRadius={60}
                  outerRadius={80}
                  paddingAngle={2}
                >
                  {el.chart.map((_, i) => (
                    <Cell key={`cell-${i}`} fill={COLORS[i % COLORS.length]} />
                  ))}
                </Pie>
                <Tooltip
                  formatter={(value: number, name: string) => [
                    `${value}%`,
                    name,
                  ]}
                />
              </PieChart>
            </ResponsiveContainer>
            <p className="text-center mt-2 text-muted-foreground text-sm">
              {el.chart[0].remaining}% complete
            </p>
          </CardContent>
        </Card>
      ))}
    </div>
  );
}
