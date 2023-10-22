import { Router, Request, Response } from "express";

const router = Router();

router.get("/", (req: Request, res: Response) => {

  // throw new Error("Not implemented");

  return res.json({ ok: true });
});

export { router };
