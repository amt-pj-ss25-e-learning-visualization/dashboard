"use client";

import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Cell,
} from "recharts";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { AverageScoreType } from "@/types/data";

export default function AverageScore({ data }: { data: AverageScoreType[] }) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Average Score per Course</CardTitle>
      </CardHeader>
      <CardContent className="h-[300px] w-full">
        <ResponsiveContainer width="100%" height="100%">
          <BarChart
            data={data}
            margin={{ top: 10, right: 30, left: 0, bottom: 5 }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="name" />
            <YAxis domain={[0, 100]} unit="%" />
            <Tooltip formatter={(value) => `${value}%`} />
            <Bar dataKey="score" radius={[4, 4, 0, 0]}>
              {data.map((entry, index) => {
                let fill = "hsl(var(--score-low))";
                if (entry.score >= 80) fill = "hsl(var(--progress-complete))";
                else if (entry.score >= 60)
                  fill = "hsl(var(--progress-remaining))";

                return <Cell key={`cell-${index}`} fill={fill} />;
              })}
            </Bar>
          </BarChart>
        </ResponsiveContainer>
      </CardContent>
    </Card>
  );
}
