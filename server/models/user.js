const mongoose = require("mongoose");
const validator = require("validator");
const bcrypt = require("bcryptjs");

const userSchema = mongoose.Schema({
  username: {
    type: String,
    require: [true, "Please tell us your name!"],
    trim: true,
    unique: true,
  },
  email: {
    type: String,
    require: [true, "Please provide an email!"],
    trim: true,
    unique: true,
    lowercase: true,
    validate: [validator.isEmail, "Please provide a valid email!"],
  },
  password: {
    type: String,
    require: [true, "Please provide a password!"],
    minLength: 8,
    trim: true,
    select: false,
  },
  avatarImgUrl: {
    type: String,
    default:
      "https://www.testhouse.net/wp-content/uploads/2021/11/default-avatar.jpg",
  },
  role: {
    type: String,
    default: "User",
  },
  createdAt: {
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
