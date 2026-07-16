require('dotenv').config();
const express = require('express');
const cors = require('cors');
const connectDB = require('../config/db');

const app = express();

app.use(cors({ origin: process.env.CLIENT_URL, credentials: true }));
app.use(express.json());

app.get('/health', (req, res) => res.json({ ok: true }));

const PORT = process.env.PORT || 5000;

const start = async () => {
  try {
    await connectDB();
    app.listen(PORT, () => console.log(`Server running on ${PORT}`));
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

start();