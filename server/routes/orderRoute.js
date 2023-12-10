const express = require("express");
const orderController = require("./../controllers/orderController");
const authController = require("./../controllers/authController");

const router = express.Router();

router
  .route("/")
  .get(authController.protect, orderController.getAllOrders)
  .post(
    authController.protect,
    authController.restrictTo("user"),
    orderController.setOrderUserIds,
    orderController.createOrder
  );

router
  .route("/:id")
  .get(orderController.getOrder)
  .patch(
    authController.protect,
    authController.restrictTo("admin"),
    orderController.updateOrder
  )
  .delete(
    authController.protect,
    authController.restrictTo("admin"),
    orderController.deleteOrder
  );

module.exports = router;
