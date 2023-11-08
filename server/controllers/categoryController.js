const catchAsync = require("../utils/catchAsync");
const Category = require("./../models/category");
const factory = require("./handlerFactory");

exports.getAllCategories = factory.getAll(Category);
exports.createCategory = factory.createOne(Category);
exports.getCategory = factory.getOne(Category);
exports.updateCategory = factory.updateOne(Category);
exports.deleteCategory = factory.deleteOne(Category);

exports.addBrandToCategory = catchAsync(async (req, res, next) => {
  const category = await Category.findById(req.params.categoryId);
  const brand = await Category.findById(req.body.brandId);
  const { brandId } = req.body;

  if (!category || !brand) {
    return next(new AppError("No category or brand found with that ID", 404));
  }

  category.brand.push(brand._id);
  brand.category.push(category._id);

  await category.save({ validateBeforeSave: false });
  await brand.save({ validateBeforeSave: false });

  res.status(200).json({
    status: "success",
    data: {
      data: category,
    },
  });
});
