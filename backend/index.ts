import express from "express";
import actorsRouter from "./routes/actors";
import config from "./config/config";

const app = express();
const PORT = config.port;

app.get("/api", (req, res) => {
  res.send("API server is running");
});

app.use("/api/actors", actorsRouter);

app.listen(PORT, () => {
  console.log(`API-Server is running at http://localhost:${PORT}`);
});