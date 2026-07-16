const router = require('express').Router();
const { createThread } = require('../controllers/threadController');

router.post('/', createThread);

module.exports = router;
