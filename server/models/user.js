const mongoose = require("mongoose");
const validator = require("validator");
const bcrypt = require("bcryptjs");

const userSchema = mongoose.Schema({
  name: {
    type: String,
    required: [true, "Please tell us your name!"],
    trim: true,
  },
  phoneNumber: {
    type: Number,
    required: [true, "Please provide a phone number!"],
    unique: true,
  },
  email: {
    type: String,
    required: [true, "Please provide an email!"],
    trim: true,
    unique: true,
    lowercase: true,
    validate: [validator.isEmail, "Please provide a valid email!"],
  },
  emailVerifiedAt: Date,
  password: {
    type: String,
    required: [true, "Please provide a password!"],
    minLength: 8,
    trim: true,
    select: false,
  },
  birthday: Date,
  gender: {
    type: String,
    enum: {
      values: ["male", "female"],
      message: "Gender is either male or female!",
    },
  },
  address: String,
  avatarImgUrl: {
    type: String,
    default:
      "https://www.testhouse.net/wp-content/uploads/2021/11/default-avatar.jpg",
  },
  activationOTP: Number,
  isActive: {
    type: Boolean,
    default: false,
  },
  role: {
    type: String,
    default: "User",
  },
  createdAt: {
    type: Date,
    default: Date.now(),
  },
  updatedAt: {
    type: Date,
    default: Date.now(),
  },
});

userSchema.pre("save", async function (next) {
  if (!this.isModified("password")) return next();

  this.password = await bcrypt.hash(this.password, 12);
  next();
});

const User = mongoose.model("User", userSchema);
module.exports = User;
