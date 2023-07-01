"use strict";

const express = require("express");
const { ensureLoggedIn } = require("../middleware/auth");
const Watchlist = require("../models/watchlist");
const User = require("../models/user");
const router = express.Router();

/** POST /watchlist/ => { watchlist }
 *
 * Create a new watchlist for the user.
 *
 * Authorization required: authenticated user
 **/
router.post("/", ensureLoggedIn, async function (req, res, next) {
  try {

    const { username } = res.locals.user;
    const { name } = req.body;
    console.log(username, name)
    console.log(req.body)
    const watchlist = await Watchlist.createWatchlist(username, name);
    console.log(watchlist)

    return res.status(201).json({ watchlist });
  } catch (err) {
    return next(err);
  }
});


/** POST /watchlist/:coinId => { message: "Coin added to watchlist" }
 *
 * Add a coin to the user's watchlist.
 *
 * Authorization required: authenticated user
 **/
router.post("/:coinId", ensureLoggedIn, async function (req, res, next) {
  try {
    const { coinId } = req.params;
    const { username } = res.locals.user;

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
    const { username } = res.locals.user;

    await Watchlist.removeFromWatchlist(username, coinId);

    return res.json({ message: "Coin removed from watchlist" });
  } catch (err) {
    return next(err);
  }
});

/** GET /watchlist => { watchlist: [ { coinId, name, symbol, price }, ... ] }
 
 * Get the user's watchlist.
 
 * Authorization required: authenticated user
 **/
// router.get("/", ensureLoggedIn, async function (req, res, next) {
//   try {
//     const { username } = res.locals.user;

//     const watchlist = await Watchlist.getWatchlist(username);

//     return res.json({ watchlist });
//   } catch (err) {
//     return next(err);
//   }
// });


router.get("/", ensureLoggedIn, async function (req, res, next) {
  try {
    const { username } = res.locals.user;

    const watchlists = await Watchlist.getWatchlists(username);

    return res.json({ watchlists });
  } catch (err) {
    return next(err);
  }
});


module.exports = router;
