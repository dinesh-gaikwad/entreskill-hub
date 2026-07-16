const Game = require('../models/Game');

const getGames = async (req, res) => {
  const games = await Game.find().sort({ createdAt: -1 });
  res.json(games);
};

module.exports = { getGames };
