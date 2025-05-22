import { Request, Response } from "express";
import { Actor } from "../models/actors";

class ActorsController {
  static async getAllActors(req: Request, res: Response) {
    try {
      const actors = await Actor.findAll();
      res.json(actors);
    } catch (error) {
      res.status(500).json({ error: "Failed to fetch actors" });
    }
  }
}

export default ActorsController;