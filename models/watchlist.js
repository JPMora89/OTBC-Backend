const db = require("../db");

class Watchlist {
  static async createWatchlist(username, watchlistName) {
    const result = await db.query(
      `INSERT INTO watchlists (username, name)
       VALUES ($1, $2)
       RETURNING watchlist_id`,
      [username, watchlistName]
    );
    return result.rows[0].watchlist_id;
  }

  static async deleteWatchlist(username, watchlistId) {
    await db.query(
      `DELETE FROM watchlists
       WHERE watchlist_id = $1
         AND username = $2`,
      [watchlistId, username]
    );
  }

  static async addToWatchlist(username, coinId, watchlistId) {
    await db.query(
      `INSERT INTO watchlist_items (watchlist_id, coin_id)
       VALUES ($1, $2)`,
      [watchlistId, coinId]
    );
  }


  static async removeFromWatchlist(username, coinId) {
    await db.query(
      `DELETE FROM watchlist_items
       WHERE watchlist_id IN (
         SELECT watchlist_id
         FROM watchlists
         WHERE username = $1
       ) AND coin_id = $2`,
      [username, coinId]
    );
  }

  static async getWatchlist(username) {
    const result = await db.query(
      `SELECT c.coin_id, c.name, c.symbol, c.price
       FROM coins AS c
       JOIN watchlist_items AS wi ON c.coin_id = wi.coin_id
       JOIN watchlists AS w ON wi.watchlist_id = w.watchlist_id
       WHERE w.username = $1`,
      [username]
    );
    return result.rows;
  }

  static async getAllWatchlists() {
    const result = await db.query(
      `SELECT watchlist_id, name, username
       FROM watchlists`
    );
    return result.rows;
  }

  static async getWatchlists(username) {
    const result = await db.query(
      `SELECT watchlist_id, name
       FROM watchlists
       WHERE username = $1`,
      [username]
    );
    return result.rows;
  }
  

  static async isInWatchlist(username, coinId) {
    const result = await db.query(
      `SELECT EXISTS (
         SELECT 1
         FROM watchlist_items AS wi
         JOIN watchlists AS w ON wi.watchlist_id = w.watchlist_id
         WHERE w.username = $1 AND wi.coin_id = $2
       )`,
      [username, coinId]
    );
    return result.rows[0].exists;
  }

  static async getWatchlistItems(watchlistId) {
    const result = await db.query(
      `SELECT c.coin_id, c.name, c.symbol, c.price
       FROM coins AS c
       JOIN watchlist_items AS wi ON c.id = wi.coin_id
       WHERE wi.watchlist_id = $1`,
      [watchlistId]
    );
    return result.rows;
  }

}

module.exports = Watchlist;
