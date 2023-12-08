const express = require("express");
const addressController = require("./../controllers/addressController");
const authController = require("./../controllers/authController");

const router = express.Router();

router.use(authController.protect);
router.use(authController.restrictTo("user", "admin"));

router
  .route("/")
  .get(addressController.getAllAddresses)
  .post(addressController.setAddressUserIds, addressController.createAddress);

router
  .route("/:id")
  .get(addressController.getAddress)
  .patch(addressController.updateAddress)
  .delete(addressController.deleteAddress);

module.exports = router;
