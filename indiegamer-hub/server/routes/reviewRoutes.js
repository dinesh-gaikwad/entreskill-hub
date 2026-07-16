const router = require('express').Router();
const { createReview } = require('../controllers/reviewController');

router.post('/', createReview);

module.exports = router;
