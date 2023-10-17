const Product = require("./../models/product");

exports.getAllProducts = async (req, res) => {
  try {
    const products = await Product.find();

    res.status(200).json({
      status: "success",
      results: Product.length,
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

exports.createProduct = async (req, res) => {
  try {
  } catch (e) {}
};

exports.getProductById = async (req, res) => {
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
