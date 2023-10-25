const mongoose = require("mongoose");
const validator = require("validator");

const productSchema = mongoose.Schema(
  {
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
      set: (val) => Math.round(val * 10) / 10,
    },
    ratingsQuantity: {
      type: Number,
      default: 0,
    },
    brand: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Brand",
    },
    createdAt: {
      type: Date,
      default: Date.now(),
      select: false,
    },
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
  }
);

productSchema.index({ regularPrice: 1, name: 1, brand: 1 });

productSchema.virtual("reviews", {
  ref: "Review",
  foreignField: "product",
  localField: "_id",
});

productSchema.pre(/^find/, function (next) {
  this.populate({
    path: "brand",
    select: "name",
  });
  next();
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;
