"use strict";

const express = require("express");
const { ensureLoggedIn } = require("../middleware/auth");
const Coin = require("../models/coins");

const router = express.Router();

// router.post("/update", ensureLoggedIn, async function (req, res, next) {
//   try {
//     await Coin.updateCoins();
//     return res.json({ message: "Coins data updated" });
//   } catch (err) {
//     return next(err);
//   }
// });

router.get("/", ensureLoggedIn, async function (req, res, next) {
  try {
    const coins = await Coin.updateCoins();
    console.log(coins)
    return res.json({ coins });
    
  } catch (err) {
    console.log(err)
    return next(err);
  }
});

/** GET /coins => { coins: [ { coin_id, name, symbol, price }, ... ] }
 *
 * Returns the list of all coins.
 *
 * Authorization required: None
 **/

router.post("/", ensureLoggedIn, async function (req, res, next) {
  try {
    const coins = await Coin.updateCoins();
    console.log(coins)
    return res.json({ coins });
    
  } catch (err) {
    console.log(err)
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
    console.log(coins)
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





module.exports = router;
