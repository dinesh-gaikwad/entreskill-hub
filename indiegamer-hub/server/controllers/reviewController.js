const Review = require('../models/Review');

const createReview = async (req, res) => {
  const review = await Review.create(req.body);
  res.status(201).json(review);
};

module.exports = { createReview };
