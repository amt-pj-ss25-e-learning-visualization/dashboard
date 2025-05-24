import { useRole } from "@/context/role-context";
import RoleSwitcher from "../role-switcher";
import {
  getAttemptsVsScoreByStudentId,
  getAverageScoreByStudentId,
  getCompletionSummaryByStudentId,
  getDaysSinceLastActivityByStudentId,
  getProgressByStudentId,
  getTimeOnTaskByStudentId,
} from "@/utils";
import ProgressDonut from "../metrics/ProgressDonut";
import TimeOnTask from "../metrics/TimeOnTask";
import AverageScore from "../metrics/AverageScore";
import AttemptAndScore from "../metrics/AttemptAndScore";
import LastActivity from "../metrics/LastActivity";
import CompletionSummaryDonut from "../metrics/CompletionSummary";

export default function Dashboard() {
  const { role } = useRole();

  const data1 = getProgressByStudentId();
  const data2 = getTimeOnTaskByStudentId();
  const data3 = getAverageScoreByStudentId();
  const data4 = getAttemptsVsScoreByStudentId();
  const data5 = getDaysSinceLastActivityByStudentId();
  const data6 = getCompletionSummaryByStudentId();

  return (
    <div className="p-4">
      <RoleSwitcher />

      <h1 className="text-2xl font-bold my-4">
        {role === "student" ? "Student Dashboard" : "Teacher Dashboard"}
      </h1>

      <div className="flex flex-col space-y-6">
        <ProgressDonut data={data1} />
        <TimeOnTask data={data2} />
        <AverageScore data={data3} />
        <AttemptAndScore data={data4} />
        <LastActivity data={data5} />
        <CompletionSummaryDonut
          data={data6.chart}
          completed={data6.completed}
          total={data6.total}
        />
      </div>
    </div>
  );
}
