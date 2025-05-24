import { Request, Response } from "express";
import { Model, ModelStatic, WhereOptions } from "sequelize";

/**
 * BaseController represents a base class for shared CRUD operations across all tables.
 */
export class BaseController<T extends Model> {
  protected model: ModelStatic<T>;

  constructor(model: ModelStatic<T>) {
    this.model = model;
  }

  /**
   * Retrieves all items from a model.
   */
  getAll = async (req: Request, res: Response) => {
    try {
      const items = await this.model.findAll();
      res.json(items);
    } catch (error) {
      res.status(500).json({ error: "500: Unexpected error occured!" });
    }
  };

  /**
   * Retrieves a single item by its ID.
   */
  getById = async (req: Request, res: Response) => {
    try {
      const id = req.params.id;
      const item = await this.model.findByPk(id);
      if (!item) {
        res.status(404).json({ error: `404: Entry with id '${id}' not found!` });
        return;
      }
      res.json(item);
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: "500: Unexpected error occured!" });
    }
  };

  /**
   * Retrieves items filtered by a specific field.
   * @param field - The field to filter by.
   * @param paramName - The name of the request parameter to use for filtering.
   */
  getByField = (field: string, paramName?: string) => async (req: Request, res: Response) => {
    try {
      const value = req.params[paramName || field];
      const where: WhereOptions = { [field]: value };
      const items = await this.model.findAll({ where });
      res.json(items);
    } catch (error) {
      res.status(500).json({ error: "500: Unexpected error occured!" });
    }
  };
}