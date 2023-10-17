const dotenv = require("dotenv");
const mongoose = require("mongoose");
const express = require("express");

dotenv.config({ path: "./.env" });

const DB = process.env.DATABASE_URL;

mongoose
  .connect(DB)
  .then(() => {
    console.log("Connection Successful");
  })
  .catch((e) => {
    console.log(e);
  });

const port = process.env.PORT || 3000;
const app = express();

app.listen(port, "0.0.0.0", () => {
  console.log(`Connected at port ${port}`);
});
