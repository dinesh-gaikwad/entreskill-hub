const router = require('express').Router();
const { getGames } = require('../controllers/gameController');

router.get('/', getGames);

module.exports = router;
