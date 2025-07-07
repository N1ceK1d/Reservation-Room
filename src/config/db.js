require('dotenv').config();
const Pool = require('pg').Pool;

const pool = new Pool({
  user: process.env.PGUSER,
  host: process.env.PGHOST,
  database: process.env.PHDATABASE,
  password: process.env.PGPASSWORD,
  port: process.env.PGPORT,
});

exports.pool = pool;