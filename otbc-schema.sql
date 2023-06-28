-- Create users table
CREATE TABLE users (
  username VARCHAR(50) PRIMARY KEY,
  password VARCHAR(100) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  is_admin BOOLEAN NOT NULL DEFAULT FALSE
);

-- Create coins table
CREATE TABLE coins (
  id SERIAL PRIMARY KEY,
  coin_id VARCHAR(100) NOT NULL UNIQUE,
  name VARCHAR(100) NOT NULL,
  symbol VARCHAR(10) NOT NULL,
  price FLOAT NOT NULL,
  last_updated TIMESTAMPTZ DEFAULT NOW()
);

-- Create watchlist table
CREATE TABLE watchlist (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) REFERENCES users(username) ON DELETE CASCADE,
  coin_id VARCHAR(100) NOT NULL REFERENCES coins(coin_id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);
