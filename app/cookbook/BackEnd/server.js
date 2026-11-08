//Setup
require('dotenv').config();
const express = require('express');
const pool = require('./config/db');
const app = express();
const PORT = 3000;

// CORS used to allow running in web.
const cors = require('cors');
app.use(cors({
  origin: '*',
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));

app.use(express.json());

// Import routes
const ingredientRoutes = require('./routes/ingredients_routes');
const shoppingRoutes = require('./routes/shopping_list_routes');

// API Endpoints
app.use('/api/ingredients', ingredientRoutes);
app.use('/api/shopping-list', shoppingRoutes);

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