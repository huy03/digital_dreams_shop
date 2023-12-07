const Order = require("./../models/order");
const factory = require("./handlerFactory");
const APIFeatures = require("./../utils/apiFeatures");
const catchAsync = require("./../utils/catchAsync");

exports.setOrderUserIds = (req, res, next) => {
  // Allow nested routes
  if (!req.body.user) req.body.user = req.user.id;
  next();
};

// exports.getAllOrders = factory.getAll(Order);
exports.createOrder = factory.createOne(Order);
exports.getOrder = factory.getOne(Order);
exports.updateOrder = factory.updateOne(Order);
exports.deleteOrder = factory.deleteOne(Order);

exports.getAllOrders = catchAsync(async (req, res, next) => {
  let filter = { user: req.user.id };

  //Execute query
  const features = new APIFeatures(Order.find(filter), req.query)
    .filter()
    .sort()
    .limitFields()
    .search()
    .paginate();
  const doc = await features.query;

  //Send response
  res.status(200).json({
    status: "success",
    results: doc.length,
    data: {
      data: doc,
    },
  });
});
