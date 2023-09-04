"use strict";

const express = require("express");
const { ensureLoggedIn } = require("../middleware/auth");
const axios = require("axios");
const Coin = require("../models/coins");

const router = express.Router();

router.get("/", ensureLoggedIn, async function (req, res, next) {
  try {
    const coins = await Coin.updateCoins();
    return res.json({ coins });
  } catch (err) {
    console.log(err);
    return next(err);
  }
});

router.post("/", ensureLoggedIn, async function (req, res, next) {
  try {
    const coins = await Coin.updateCoins();
    return res.json({ coins });
  } catch (err) {
    console.log(err);
    return next(err);
  }
});
/** GET /coins/all => { coins: [ { coin_id, name, symbol, price }, ... ] }
 *
 * Returns the list of all coins.
 *
 * Authorization required: None
 **/
router.get("/all", ensureLoggedIn, async function (req, res, next) {
  try {
    const coins = await Coin.getAllCoins();
    return res.json({ coins });
  } catch (err) {
    return next(err);
  }
});

/** GET /coins/:coinId => { coin }
 *
 * Returns the details of a specific coin.
 *
 * Authorization required: None
 **/

router.get("/:coinId", async function (req, res, next) {
  try {
    const coin = await Coin.getCoinById(req.params.coinId);
    if (!coin) {
      return res.status(404).json({ message: "Coin not found" });
    }
    return res.json({ coin });
  } catch (err) {
    return next(err);
  }
});

// Get coin by name
router.get("/name/:coinName", async function (req, res, next) {
  try {
    const coin = await Coin.getCoinByName(req.params.coinName);
    if (!coin) {
      return res.status(404).json({ message: "Coin not found" });
    }
    return res.json({ coin });
  } catch (err) {
    return next(err);
  }
});

/** GET /coins/news/:coinId => { news }
 *
 * Returns news related to a specific coin.
 *
 * Authorization required: None
 **/
router.get("/news/:coinId", async function (req, res, next) {
  try {
    const coinId = req.params.coinId;

    // Make a request to the cryptopanic.com API for news related to the coinId
    const response = await axios.get(
      `https://cryptopanic.com/api/v1/posts/?auth_token=12a2442613bd9a59f7b47b9c8da4001642d3b126&public=true&currencies=${coinId}`
    );

    // Extract and send the news data from the API response
    const news = response.data.results;

    return res.json({ news });
  } catch (err) {
    console.error("Error fetching coin news:", err);
    return next(err);
  }
});


// Get coin by name or symbol
router.get(
  "/name-or-symbol/:coinNameOrSymbol",
  async function (req, res, next) {
    try {
      const coin = await Coin.getCoinByNameOrSymbol(
        req.params.coinNameOrSymbol
      );
      console.log("This function is running");
      if (!coin) {
        return res.status(404).json({ message: "Coin not found" });
      }
      return res.json({ coin });
    } catch (err) {
      return next(err);
    }
  }
);

module.exports = router;
