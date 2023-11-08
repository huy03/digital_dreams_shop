const mongoose = require("mongoose");

const categorySchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: [true, "A category must have a name!"],
      unique: true,
    },
    brandCount: {
      type: Number,
      default: 0,
    },
    productCount: {
      type: Number,
      default: 0,
    },
    image: String,
    brand: [
      {
        type: mongoose.Schema.ObjectId,
        ref: "Category",
      },
    ],
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
    timestamps: true,
  }
);

categorySchema.virtual("products", {
  ref: "Product",
  foreignField: "category",
  localField: "_id",
});

const Category = mongoose.model("Category", categorySchema);

module.exports = Category;
