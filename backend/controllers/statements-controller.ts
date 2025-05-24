import { Request, Response } from "express";
import { BaseController } from "./base-controller";
import { Statement } from "../models/statements-model";

class StatementsController extends BaseController<Statement> {
  constructor() {
    super(Statement);
  }

  // TODO: Remove class and use BaseController methods directly - if we dont need specialized methods for this endpoint
}

const statementController = new StatementsController();
export default statementController;