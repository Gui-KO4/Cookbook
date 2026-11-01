//Setup
require('dotenv').config();

const express = require('express');
const pool = require('./config/db');

const app = express();
const PORT = 3000; 

app.use(express.json());


// Start server only if DB connection succeeds
async function startServer() {
  try {
    await pool.query('SELECT 1');
    console.log('Database connected successfully.');
    
    app.listen(PORT, () => {
      console.log(`Server is running on port ${PORT}`);
    });
  } catch (error) {
    console.error('Failed to connect to the database:', error.message);
    process.exit(1);
  }
}

startServer();

