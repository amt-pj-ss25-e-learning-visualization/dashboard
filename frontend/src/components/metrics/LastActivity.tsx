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
import { LastActivityType } from "@/types/data";

export default function LastActivity({ data }: { data: LastActivityType[] }) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Days Since Last Activity</CardTitle>
      </CardHeader>
      <CardContent className="h-[300px]">
        <ResponsiveContainer width="100%" height="100%">
          <BarChart
            data={data}
            margin={{ top: 10, right: 30, left: 0, bottom: 5 }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="name" />
            <YAxis
              label={{ value: "Days", angle: -90, position: "insideLeft" }}
            />
            <Tooltip formatter={(value) => `${value} days`} />
            <Bar dataKey="daysAgo" radius={[4, 4, 0, 0]}>
              {data.map((entry, index) => {
                let fill = "hsl(var(--progress-complete))";
                if (entry.daysAgo > 7) {
                  fill = "hsl(var(--score-low))";
                } else if (entry.daysAgo > 3) {
                  fill = "hsl(var(--progress-remaining))";
                }
                return <Cell key={`cell-${index}`} fill={fill} />;
              })}
            </Bar>
          </BarChart>
        </ResponsiveContainer>
      </CardContent>
    </Card>
  );
}
