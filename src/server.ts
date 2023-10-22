import { router } from "./routes";
import express, { Router, Request, NextFunction } from "express";

const app = express();

app.use(express.json());

app.use(router);

const port = 3333

app.listen(port, () => {
  console.log(`SERVER ONLINE on port ${port}`);
});
