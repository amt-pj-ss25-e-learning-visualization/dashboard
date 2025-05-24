import Layout from "./components/app-sidebar/layout";
import Dashboard from "./components/dashboard";
import { RoleProvider } from "./context/role-context";

export default function App() {
  return (
    <RoleProvider>
      <Layout>
        <Dashboard />
      </Layout>
    </RoleProvider>
  );
}
