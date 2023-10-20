const mongoose = require("mongoose");
const validator = require("validator");

const productSchema = mongoose.Schema({
  name: {
    type: String,
    required: [true, "Product must have a name"],
    unique: true,
    trim: true,
  },
  regularPrice: {
    type: Number,
    required: [true, "Product must have a price"],
  },
  discountPrice: {
    type: Number,
    default: this.regular_price,
  },
  quantity: {
    type: Number,
    required: true,
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
    min: [0, "Rating must be above 0"],
    max: [5, "Rating must be below 5.0"],
  },
  ratingsQuantity: {
    type: Number,
    default: 0,
  },
  createdAt: {
    type: Date,
    default: Date.now(),
    select: false,
  },
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;
