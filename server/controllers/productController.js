const Product = require("./../models/product");
const factory = require("./handlerFactory");
const catchAsync = require("./../utils/catchAsync");

exports.getAllProducts = factory.getAll(Product);
exports.getProduct = factory.getOne(Product, { path: "reviews" });
exports.createProduct = factory.createOne(Product);
exports.updateProduct = factory.updateOne(Product);
exports.deleteProduct = factory.deleteOne(Product);
