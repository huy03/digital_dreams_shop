const mongoose = require("mongoose");

const couponSchema = new mongoose.Schema(
  {
    code: {
      type: String,
      required: true,
      unique: true,
      minLength: 10,
      uppercase: true,
    },
    subtitle: String,
    discountValue: {
      type: Number,
      required: true,
    },
    maximumDiscountValue: {
      type: Number,
    },
    minimumSpend: {
      type: Number,
    },
    usageCount: {
      type: Number,
    },
    usageLimit: {
      type: Number,
    },
    startDate: {
      type: Date,
    },
    expirationDate: {
      type: Date,
    },
    imageCover: String,
  },
  {
    toJSON: { virtuals: true },
    toObject: { virtuals: true },
    timestamps: true,
  }
);

module.exports = mongoose.model("Coupon", couponSchema);
