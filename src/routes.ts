import { Router, Request, Response } from "express";

import { CreateUserController } from "./controllers/user/CreateUserController";

const router = Router();

router.get("/", (req: Request, res: Response) => {
  // throw new Error("Not implemented");
  return res.json({ ok: true });
});

router.post("/users", new CreateUserController().handle);

export { router };
