import { Button } from "@/components/ui/button";
import { useRole } from "@/context/role-context";
import { ArrowLeftRight } from "lucide-react";

export default function RoleSwitcher() {
  const { role, setRole } = useRole();

  const toggleRole = () => {
    setRole(role === "student" ? "teacher" : "student");
  };

  return (
    <Button variant="outline" onClick={toggleRole}>
      <ArrowLeftRight />
      Switch to {role === "student" ? "Teacher" : "Student"} Role
    </Button>
  );
}
