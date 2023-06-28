"use strict";

const express = require("express");
const { ensureLoggedIn } = require("../middleware/auth");
const Watchlist = require("../models/watchlist");

const router = express.Router();

/** POST /watchlist/:coinId => { message: "Coin added to watchlist" }
 *
 * Add a coin to the user's watchlist.
 *
 * Authorization required: authenticated user
 **/
router.post("/:coinId", ensureLoggedIn, async function (req, res, next) {
  try {
    const { coinId } = req.params;
    const { username } = req.user;

    await Watchlist.addToWatchlist(username, coinId);

    return res.json({ message: "Coin added to watchlist" });
  } catch (err) {
    return next(err);
  }
});

/** DELETE /watchlist/:coinId => { message: "Coin removed from watchlist" }
 *
 * Remove a coin from the user's watchlist.
 *
 * Authorization required: authenticated user
 **/
router.delete("/:coinId", ensureLoggedIn, async function (req, res, next) {
  try {
    const { coinId } = req.params;
    const { username } = req.user;

    await Watchlist.removeFromWatchlist(username, coinId);

    return res.json({ message: "Coin removed from watchlist" });
  } catch (err) {
    return next(err);
  }
});

/** GET /watchlist => { watchlist: [ { coinId, name, symbol, price }, ... ] }
 *
 * Get the user's watchlist.
 *
 * Authorization required: authenticated user
 **/
router.get("/", ensureLoggedIn, async function (req, res, next) {
  try {
    const { username } = req.user;

    const watchlist = await Watchlist.getWatchlist(username);

    return res.json({ watchlist });
  } catch (err) {
    return next(err);
  }
});

module.exports = router;
