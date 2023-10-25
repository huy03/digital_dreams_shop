const Brand = require("./../models/brand");
const factory = require("./handlerFactory");

exports.getAllBrands = factory.getAll(Brand);
exports.createBrand = factory.createOne(Brand);
exports.getBrand = factory.getOne(Brand);
exports.updateBrand = factory.updateOne(Brand);
exports.deleteBrand = factory.deleteOne(Brand);
