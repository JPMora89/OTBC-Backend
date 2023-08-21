--  Create users table
CREATE TABLE users (
  username VARCHAR(50) PRIMARY KEY,
  password VARCHAR(100) NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL
);

-- Create coins table
CREATE TABLE coins (
  id SERIAL PRIMARY KEY,
  coin_id VARCHAR(50) NOT NULL,
  name VARCHAR(500) NOT NULL,
  symbol VARCHAR(50) NOT NULL,
  price FLOAT NOT NULL,
  image VARCHAR(500),
  market_cap FLOAT NOT NULL,
  price_change_percentage_24h FLOAT,
  last_updated TIMESTAMPTZ DEFAULT NOW()
);

-- Create watchlists table
CREATE TABLE watchlists (
  watchlist_id SERIAL PRIMARY KEY,
  username VARCHAR(50) REFERENCES users(username) ON DELETE CASCADE,
  name VARCHAR(100) NOT NULL,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE watchlist_items (
  watchlist_item_id SERIAL PRIMARY KEY,
  watchlist_id INTEGER REFERENCES watchlists(watchlist_id) ON DELETE CASCADE,
  coin_id INTEGER NOT NULL REFERENCES coins(id) ON DELETE CASCADE
);

GRANT SELECT, INSERT ON TABLE users TO PUBLIC;

GRANT SELECT ON TABLE coins TO PUBLIC;


GRANT SELECT, INSERT ON TABLE watchlists TO PUBLIC;
GRANT SELECT, INSERT ON TABLE watchlist_items TO PUBLIC;
