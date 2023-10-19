const { Double, Int32, Timestamp } = require("mongodb");
const mongoose = require("mongoose");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    require: [true, "Product must have a name"],
    unique: true,
    trim: true,
  },
  regularPrice: {
    type: Number,
    require: [true, "Product must have a price"],
  },
  discountPrice: {
    type: Number,
    default: this.regular_price,
  },
  quantity: {
    type: Number,
    require: true,
  },
  color: [String],
  extraProperties: {
    type: Map,
    default: null,
  },
  images: [String],
  description: {
    type: String,
  },
  is_published: {
    type: Boolean,
    default: true,
  },
  ratingsAverage: {
    type: Number,
    default: 0,
  },
  ratingsQuantity: {
    type: Number,
    default: 0,
  },
  createdAt: {
    type: Date,
    default: Date.now(),
  },
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;
