const mysql = require('mysql2/promise');

// Note to the professors: Please ensure to add a .env file or change manually bellow.
// If changed manually here please remove the required from the server.js or it won't work

const pool = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  port: Number(process.env.DB_PORT) || 3306,
  user: process.env.DB_USER || 'root',
  password: process.env.DB_PASSWORD || 'root',
  database: process.env.DB_NAME || 'cookbook',
  connectionLimit: 20
});

module.exports = pool;
