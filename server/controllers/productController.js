const Product = require("./../models/product");
const factory = require("./handlerFactory");
const catchAsync = require("./../utils/catchAsync");
const AppError = require("./../utils/appError");

exports.getAllProducts = factory.getAll(Product);
exports.getProduct = factory.getOne(Product, { path: "reviews" });
exports.createProduct = factory.createOne(Product);
exports.updateProduct = factory.updateOne(Product);
exports.deleteProduct = factory.deleteOne(Product);

exports.addToWishlist = catchAsync(async (req, res, next) => {
  const product = await Product.findById(req.params.id);
  if (!product) {
    return next(new AppError("No product found with that ID", 404));
  }

  if (req.user.wishlist.includes(req.params.id)) {
    req.user.wishlist.pull(req.params.id);
  } else {
    req.user.wishlist.push(req.params.id);
  }

  await req.user.save({ validateBeforeSave: false });

  res.status(200).json({
    status: "success",
    data: {
      data: req.user,
    },
  });
});
