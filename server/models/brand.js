const mongoose = require("mongoose");

const brandSchema = mongoose.Schema({
  name: {
    type: String,
    required: [true, "Brand must have a name"],
  },
});

const Brand = mongoose.model("Brand", brandSchema);
module.exports = Brand;
