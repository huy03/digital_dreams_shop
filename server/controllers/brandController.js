const catchAsync = require("../utils/catchAsync");
const Brand = require("./../models/brand");

exports.getAllBrands = catchAsync(async (req, res, next) => {
  const brands = await Brand.find();

  res.status(200).json({
    status: "success",
    results: brands.length,
    data: {
      brands,
    },
  });
});

exports.createBrand = catchAsync(async (req, res, next) => {
  const newBrand = await Brand.create(req.body);

  res.status(201).json({
    status: "success",
    data: {
      brand: newBrand,
    },
  });
});

exports.getBrand = catchAsync(async (req, res, next) => {
  const brand = await Brand.findById(req.params.id);

  res.status(200).json({
    status: "success",
    data: {
      brand,
    },
  });
});

exports.updateBrand = catchAsync(async (req, res, next) => {
  const brand = await Brand.findByIdAndUpdate(req.params.id, req.body, {
    new: true,
    runValidators: true,
  });

  res.status(200).json({
    status: "success",
    data: {
      brand,
    },
  });
});

exports.deleteBrand = catchAsync(async (req, res, next) => {
  await Brand.findByIdAndUpdate(req.params.id);

  res.status(204).json({
    status: "success",
    data: null,
  });
});
