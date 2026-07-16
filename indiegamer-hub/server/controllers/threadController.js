const Thread = require('../models/Thread');

const createThread = async (req, res) => {
  const thread = await Thread.create(req.body);
  res.status(201).json(thread);
};

module.exports = { createThread };
