const express = require("express");
const productController = require("./../controllers/productController");

const productRouter = express.Router();

productRouter
  .route("/")
  .get(productController.getAllProducts)
  .post(productController.createProduct);

productRouter.route("/:id").get(productController.getProductById);
