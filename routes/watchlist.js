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
    // console.log(username, name)
    // console.log(req.body)
    const watchlist = await Watchlist.createWatchlist(username, name);
    // console.log(watchlist)

    return res.status(201).json({ watchlist });
  } catch (err) {
    return next(err);
  }
});



/** DELETE /watchlist/:watchlistId => { message: "Watchlist deleted" }
 *
 * Delete a watchlist.
 *
 * Authorization required: authenticated user
 **/
router.delete("/:watchlistId", ensureLoggedIn, async function (req, res, next) {
  try {
    const { watchlistId } = req.params;
    const { username } = res.locals.user;

    await Watchlist.deleteWatchlist(username, watchlistId);

    return res.json({ message: "Watchlist deleted" });
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
router.post("/:watchlistId/:coinId", ensureLoggedIn, async function (req, res, next) {
  try {
    const { coinId } = req.params;
    const { watchlistId } = req.params;
    const { username } = res.locals.user;

    await Watchlist.addToWatchlist(username, coinId, watchlistId);

    return res.json({ message: "Coin added to watchlist" });
  } catch (err) {
    return next(err);
  }
});



/** GET /watchlist/:watchlistId/items => { watchlistItems: [ { coinId, name, symbol, price }, ... ] }
 *
 * Get the watchlist items for a specific watchlist.
 *
 * Authorization required: authenticated user
 **/
router.get("/:watchlistId/items", ensureLoggedIn, async function (req, res, next) {
  try {
    const { watchlistId } = req.params;
    const { username } = res.locals.user;

    // Check if the user has access to the specified watchlist
    const userWatchlists = await Watchlist.getWatchlists(username);
    const watchlistExists = userWatchlists.some((watchlist) => watchlist.watchlist_id === parseInt(watchlistId));
    if (!watchlistExists) {
      return res.status(403).json({ error: "You don't have access to this watchlist" });
    }

    // Fetch the watchlist items
    const watchlistItems = await Watchlist.getWatchlistItems(parseInt(watchlistId));

    return res.json({ watchlistItems });
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
// router.delete("/:coinId", ensureLoggedIn, async function (req, res, next) {
//   try {
//     const { coinId } = req.params;
//     const { username } = res.locals.user;

//     await Watchlist.removeFromWatchlist(username, coinId);

//     return res.json({ message: "Coin removed from watchlist" });
//   } catch (err) {
//     return next(err);
//   }
// });
router.delete("/:watchlistId/:coinId", ensureLoggedIn, async function (req, res, next) {
  try {
    const { coinId, watchlistId } = req.params;
    const { username } = res.locals.user;

    await Watchlist.removeFromWatchlist(username, coinId, watchlistId);

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
