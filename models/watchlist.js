const db = require("../db");

class Watchlist {
  /** Add a coin to a user's watchlist */
  static async addToWatchlist(username, coinId) {
    await db.query(
      `INSERT INTO watchlist (username, coin_id)
       VALUES ($1, $2)`,
      [username, coinId]
    );
  }

  /** Remove a coin from a user's watchlist */
  static async removeFromWatchlist(username, coinId) {
    await db.query(
      `DELETE FROM watchlist
       WHERE username = $1 AND coin_id = $2`,
      [username, coinId]
    );
  }

  /** Get a user's watchlist */
  static async getWatchlist(username) {
    const result = await db.query(
      `SELECT c.coin_id, c.name, c.symbol, c.price
       FROM coins AS c
       JOIN watchlist AS w ON c.coin_id = w.coin_id
       WHERE w.username = $1`,
      [username]
    );
    return result.rows;
  }

  /** Check if a coin is in a user's watchlist */
  static async isInWatchlist(username, coinId) {
    const result = await db.query(
      `SELECT EXISTS (
         SELECT 1
         FROM watchlist
         WHERE username = $1 AND coin_id = $2
       )`,
      [username, coinId]
    );
    return result.rows[0].exists;
  }
}

module.exports = Watchlist;
