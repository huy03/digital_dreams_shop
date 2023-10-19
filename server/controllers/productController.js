const Product = require("./../models/product");

exports.getAllProducts = async (req, res) => {
  try {
    //Build query
    //FILTERING
    const queryObject = { ...req.query };
    const excludedFields = ["page", "sort", "limit", "fields"];
    excludedFields.forEach((element) => delete queryObject[element]);

    let queryString = JSON.stringify(queryObject);
    queryString = queryString.replace(
      /\b(gte|gt|lte|lt)\b/g,
      (match) => `$${match}`
    );

    let query = Product.find(JSON.parse(queryString));

    //SORTING
    if (req.query.sort) {
      const sortBy = req.query.sort.split(",").join(" ");
      query = query.sort(sortBy);
    } else {
      query = query.sort("-createdAt");
    }

    //Execute query
    const products = await query;

    //Send response
    res.status(200).json({
      status: "success",
      results: products.length,
      data: {
        products,
      },
    });
  } catch (e) {
    res.status(404).json({
      status: "failed",
      message: e,
    });
  }
};

exports.getProduct = async (req, res) => {
  try {
    const product = await Product.findById(req.params.id);

    res.status(200).json({
      status: "success",
      data: {
        product,
      },
    });
  } catch (e) {
    res.status(404).json({
      status: "failed",
      message: e,
    });
  }
};

exports.createProduct = async (req, res) => {
  try {
    const newProduct = await Product.create(req.body);

    res.status(201).json({
      status: "success",
      data: {
        product: newProduct,
      },
    });
  } catch (e) {}
};

exports.updateProduct = async (req, res) => {
  try {
    const product = await Product.findByIdAndUpdate(req.params.id, req.body, {
      new: true,
      runValidators: true,
    });

    res.status(200).json({
      status: "success",
      data: {
        product,
      },
    });
  } catch (e) {}
};

exports.deleteProduct = async (req, res) => {
  try {
    await Product.findByIdAndUpdate(req.params.id);

    res.status(204).json({
      status: "success",
      data: null,
    });
  } catch (e) {}
};
