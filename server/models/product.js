const { Double, Int32, Timestamp } = require("mongodb");
const mongoose = require("mongoose");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    require: true,
    trim: true,
  },
  regularPrice: {
    type: Number,
    require: true,
  },
  discountPrice: {
    type: Number,
    default: this.regular_price,
  },
  quantity: {
    type: Number,
    require: true,
  },
  color: {
    type: Map,
    of: String,
    require: true,
  },
  extraProperties: {
    type: Map,
  },
  images: {
    type: Map,
  },
  description: {
    type: String,
  },
  is_published: {
    type: Boolean,
    default: true,
  },
  ratingsAverage: {
    type: Double,
  },
  ratingsQuantity: {
    type: Number,
  },
  createdAt: {
    type: Date,
    default: Date.now(),
  },
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;
