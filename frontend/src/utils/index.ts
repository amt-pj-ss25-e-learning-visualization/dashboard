import { differenceInDays } from "date-fns";

// Getting data for progress donut chart

import { studentData } from "@/api";
import { AverageScoreType, ProgressDonutType } from "@/types/data";

export function getProgressByStudentId(studentId: string = 's1'): ProgressDonutType[] {
  const student = studentData.find((s) => s.studentId === studentId);
  if (!student) return [];

  return student.courses.map((course) => ({
    ...course, chart: [
      { status: "Completed", remaining: Math.round(course.progress * 100) },
      { status: "In Progress", remaining: 100 - Math.round(course.progress * 100) },
    ]
  }))
}

// Getting data for time on task chart

export function getTimeOnTaskByStudentId(studentId: string = "s1") {
  const student = studentData.find((s) => s.studentId === studentId);
  if (!student) return [];

  return student.courses.map((course) => ({
    name: course.courseName,
    minutes: course.timeOnTaskMinutes,
  }));
}

// Getting data for average score chart
export function getAverageScoreByStudentId(studentId: string = "s1"): AverageScoreType[] {
  const student = studentData.find((s) => s.studentId === studentId);
  if (!student) return [];

  return student.courses.map((course) => ({
    name: course.courseName,
    score: course.averageScore,
  }));
}

// Getting data for attempts vs score chart

export function getAttemptsVsScoreByStudentId(studentId: string = "s1") {
  const student = studentData.find((s) => s.studentId === studentId);
  if (!student) return [];

  return student.courses.map((course) => ({
    name: course.courseName,
    attempts: course.attempts,
    score: course.averageScore,
  }));
}

// Getting data for days since last activity

export function getDaysSinceLastActivityByStudentId(studentId: string = "s1") {
  const student = studentData.find((s) => s.studentId === studentId);
  if (!student) return [];

  return student.courses.map((course) => ({
    name: course.courseName,
    daysAgo: differenceInDays(new Date(), new Date(course.lastActivity)),
  }));
}

// Getting data for completion summary

export function getCompletionSummaryByStudentId(studentId: string = "s1") {
  const student = studentData.find((s) => s.studentId === studentId);
  if (!student) return { completed: 0, total: 0, chartData: [] };

  const total = student.courses.length;
  const completed = student.courses.filter((c) => c.completed).length;

  return {
    completed,
    total,
    chart: [
      { label: "Courses Completed", value: completed },
      { label: "Courses Remaining", value: total - completed },
    ],
  };
}
