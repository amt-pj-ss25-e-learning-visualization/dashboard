import express from "express";
import ActorsController from '../controllers/actors';

const router = express.Router();

router.get('/', ActorsController.getAllActors);

export default router;