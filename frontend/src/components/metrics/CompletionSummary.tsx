"use client";

import { PieChart, Pie, Cell, Tooltip, ResponsiveContainer } from "recharts";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { CompletionSummary } from "@/types/data";

const COLORS = [
  "hsl(var(--progress-complete))",
  "hsl(var(--progress-remaining))",
];

export default function CompletionSummaryDonut({
  data,
  completed,
  total,
}: {
  data: CompletionSummary[] | undefined;
  completed: number;
  total: number;
}) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Course Completion Summary</CardTitle>
      </CardHeader>
      <CardContent>
        <ResponsiveContainer width="100%" height={240}>
          <PieChart>
            <Pie
              data={data}
              innerRadius={70}
              outerRadius={90}
              paddingAngle={2}
              dataKey="value"
              nameKey="label"
            >
              {data?.map((_, i) => (
                <Cell key={`cell-${i}`} fill={COLORS[i % COLORS.length]} />
              ))}
            </Pie>
            <Tooltip
              formatter={(value: number, name: string) => [
                `${value} course(s)`,
                name,
              ]}
            />
          </PieChart>
        </ResponsiveContainer>
        <p className="text-center mt-4 text-xl font-semibold">
          {completed} / {total} courses completed
        </p>
      </CardContent>
    </Card>
  );
}
