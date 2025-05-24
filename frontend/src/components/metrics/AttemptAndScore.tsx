"use client";

import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
  Legend,
  Cell,
} from "recharts";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { AttemptsVsScoreType } from "@/types/data";

export default function AttemptAndScore({
  data,
}: {
  data: AttemptsVsScoreType[];
}) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Attempts vs. Score per Course</CardTitle>
      </CardHeader>
      <CardContent className="h-[300px] w-full">
        <ResponsiveContainer width="100%" height="100%">
          <BarChart
            data={data}
            margin={{ top: 10, right: 30, left: 0, bottom: 5 }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="name" />
            <YAxis />
            <Tooltip />
            <Legend />
            <Bar dataKey="attempts" radius={[4, 4, 0, 0]}>
              {data.map((entry, index) => (
                <Cell
                  key={`cell-attempt-${index}`}
                  fill={
                    entry.attempts >= 4
                      ? "hsl(var(--score-low))"
                      : "hsl(var(--progress-remaining))"
                  }
                />
              ))}
            </Bar>
            <Bar
              dataKey="score"
              fill="hsl(var(--progress-complete))"
              radius={[4, 4, 0, 0]}
            />
          </BarChart>
        </ResponsiveContainer>
      </CardContent>
    </Card>
  );
}
