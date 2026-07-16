const mongoose = require('mongoose');

const gameSchema = new mongoose.Schema(
  {
    title: { type: String, required: true },
    description: String,
    genre: [String],
    releaseDate: Date,
    developer: { type: mongoose.Schema.Types.ObjectId, ref: 'User' },
    screenshots: [String],
    storeLinks: {
      steam: String,
      epic: String,
      itch: String
    },
    price: Number,
    tags: [String],
    averageRating: { type: Number, default: 0 },
    reviewCount: { type: Number, default: 0 },
    isFeatured: { type: Boolean, default: false },
    trailerUrl: String
  },
  { timestamps: true }
);

module.exports = mongoose.model('Game', gameSchema);
