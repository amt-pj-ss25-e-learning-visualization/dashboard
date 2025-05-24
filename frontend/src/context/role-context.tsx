import { createContext, useContext, useState } from "react";

type Role = "student" | "teacher";

const RoleContext = createContext<{
  role: Role;
  setRole: (role: Role) => void;
}>({
  role: "student",
  setRole: () => {},
});

export const RoleProvider = ({ children }: { children: React.ReactNode }) => {
  const [role, setRole] = useState<Role>("student");

  return (
    <RoleContext.Provider value={{ role, setRole }}>
      {children}
    </RoleContext.Provider>
  );
};

export const useRole = () => useContext(RoleContext);
