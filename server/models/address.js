const mongoose = require("mongoose");

const addressSchema = mongoose.Schema(
  {
    phoneNumber: {
      type: Number,
      required: [true, "Address must have a phone number!"],
    },
    detailedAddress: {
      type: String,
      required: [true, "Address must have a detailed address!"],
    },
    district: {
      type: String,
      required: [true, "Address must have district!"],
    },
    city: {
      type: String,
      required: [true, "Address must have city!"],
    },
    country: {
      type: String,
      required: [true, "Address must have country!"],
    },
    isDefault: {
      type: Boolean,
      default: false,
    },
  },
  {
    timestamps: true,
  }
);

const Address = mongoose.model("Address", addressSchema);
module.exports = Address;
