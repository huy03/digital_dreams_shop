const mongoose = require("mongoose");
const Category = require("./category");

const brandSchema = mongoose.Schema(
  {
    name: {
      type: String,
      required: [true, "Brand must have a name"],
      uppercase: true,
      unique: true,
    },
    productCount: {
      type: Number,
      default: 0,
    },
    category: [
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

brandSchema.pre(/^find/, function (next) {
  this.populate({ path: "category", select: "name" });
  next();
});

const Brand = mongoose.model("Brand", brandSchema);
module.exports = Brand;
