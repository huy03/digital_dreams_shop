const mongoose = require("mongoose");
const validator = require("validator");
const Category = require("./category");

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
    category: {
      type: mongoose.Schema.Types.ObjectId,
      ref: "Category",
      required: [true, "Product must belong to a category"],
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

productSchema.pre(/^find/, function (next) {
  this.populate({ path: "category", select: "name" });
  next();
});

productSchema.virtual("reviews", {
  ref: "Review",
  foreignField: "product",
  localField: "_id",
});

productSchema.statics.calcAverageRatings = async function (categoryId) {
  const stats = await this.aggregate([
    {
      $match: { category: categoryId },
    },
    {
      $group: {
        _id: "$category",
        nCount: { $sum: 1 },
      },
    },
  ]);

  if (stats.length > 0) {
    await Category.findByIdAndUpdate(categoryId, {
      productCount: stats[0].nCount,
    });
  } else {
    await Category.findByIdAndUpdate(productId, {
      productCount: 0,
    });
  }
};

productSchema.post("save", function () {
  this.constructor.calcAverageRatings(this.category);
});

productSchema.pre(/^findOneAnd/, async function (next) {
  this.p = await this.clone().findOne();

  next();
});

productSchema.post(/^findOneAnd/, async function () {
  // await this.findOne(); does NOT work here, query has already executed
  await this.p.constructor.calcAverageRatings(this.p.category);
});

const Product = mongoose.model("Product", productSchema);
module.exports = Product;
