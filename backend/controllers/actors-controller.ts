import { Request, Response } from "express";
import { BaseController } from "./base-controller";
import { Actor } from "../models/actors-model";

class ActorsController extends BaseController<Actor> {
  constructor() {
    super(Actor);
  }

  // TODO: Remove class and use BaseController methods directly - if we dont need specialized methods for this endpoint
}

const actorsController = new ActorsController();
export default actorsController;