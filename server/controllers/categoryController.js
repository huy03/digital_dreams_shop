const Category = require("./../models/category");
const factory = require("./handlerFactory");

exports.getAllCategories = factory.getAll(Category);
exports.createCategory = factory.createOne(Category);
exports.getCategory = factory.getOne(Category);
exports.updateCategory = factory.updateOne(Category);
exports.deleteCategory = factory.deleteOne(Category);
