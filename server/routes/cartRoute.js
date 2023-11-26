const express = require("express");
const cartController = require("./../controllers/cartController");
const authController = require("./../controllers/authController");
const productRouter = require("./../routes/productRoute");

const router = express.Router();

router.use(authController.protect);

router
  .route("/")
  .get(cartController.getAllCartItems)
  .post(authController.restrictTo("user"), cartController.addToCart)
  .patch(authController.restrictTo("user"), cartController.updateCart);

router
  .route("/:id")
  .get(cartController.getCart)
  .delete(
    authController.protect,
    authController.restrictTo("admin"),
    cartController.deleteCart
  );

router
  .route("/increase")
  .patch(
    authController.restrictTo("user"),
    cartController.increaseCartQuantity
  );

router
  .route("/decrease")
  .patch(
    authController.restrictTo("user"),
    cartController.decreaseCartQuantity
  );

module.exports = router;
