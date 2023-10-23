const mongoose = require("mongoose");

const brandSchema = mongoose.Schema({
  name: {
    type: String,
    required: [true, "Brand must have a name"],
    uppercase: true,
  },
  productCount: {
    type: Number,
    default: 0,
  },
  createdAt: {
    type: Date,
    default: Date.now(),
  },
  updatedAt: Date,
});

const Brand = mongoose.model("Brand", brandSchema);
module.exports = Brand;
