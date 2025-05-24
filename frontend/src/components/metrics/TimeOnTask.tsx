"use client";

import {
  BarChart,
  Bar,
  XAxis,
  YAxis,
  CartesianGrid,
  Tooltip,
  ResponsiveContainer,
} from "recharts";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { TimeOnTaskType } from "@/types/data";

export default function TimeOnTask({ data }: { data: TimeOnTaskType[] }) {
  return (
    <Card>
      <CardHeader>
        <CardTitle>Time on Task per Course</CardTitle>
      </CardHeader>
      <CardContent className="h-[300px] w-full">
        <ResponsiveContainer width="100%" height="100%">
          <BarChart
            layout="vertical"
            data={data}
            margin={{ top: 10, right: 30, left: 30, bottom: 5 }}
          >
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis type="number" unit=" min" />
            <YAxis dataKey="name" type="category" />
            <Tooltip formatter={(value) => `${value} minutes`} />
            <Bar
              dataKey="minutes"
              fill="hsl(var(--progress-time))"
              radius={[0, 6, 6, 0]}
            />
          </BarChart>
        </ResponsiveContainer>
      </CardContent>
    </Card>
  );
}
