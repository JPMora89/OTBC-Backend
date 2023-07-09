

const db = require("../db");
const axios = require("axios");

const BASE_URL = "https://api.coingecko.com/api/v3";

class Coin {
  /** Fetch coin data from the API and update the coins table in the database */
  static async updateCoins() {
    try {
      // Fetch coin data from the API
      const response = await axios.get(`${BASE_URL}/coins/markets`, {
        params: {
          vs_currency: "usd",
          order: "market_cap_desc",
          per_page: 25,
          page: 1,
          sparkline: false,
        },
      });

      const coins = response.data;
      console.log(coins, "here are the coins!");

      // Update coins table in the database
      await db.query("DELETE FROM watchlist_items");
      await db.query("TRUNCATE TABLE coins RESTART IDENTITY CASCADE");

      for (const coin of coins) {
        await db.query(
          `INSERT INTO coins (coin_id, name, symbol, price, image, market_cap, price_change_percentage_24h)
           VALUES ($1, $2, $3, $4, $5, $6, $7)`,
          [coin.id, coin.name, coin.symbol, coin.current_price, coin.image, coin.market_cap, coin.price_change_percentage_24h]
        );
      }

      console.log("Coins data updated successfully");
    } catch (error) {
      console.error("Error updating coins data:", error);
    }
  }

  /** Get all coins from the database */
  static async getAllCoins() {
    const result = await db.query("SELECT * FROM coins ORDER BY id");
    return result.rows;
  }

  /** Get coin by coin_id */
  static async getCoinById(id) {
    const result = await db.query("SELECT * FROM coins WHERE id = $1", [
      id,
    ]);

    if (result.rows.length === 0) {
      return null;
    }

    return result.rows[0];
  }
}

module.exports = Coin;

