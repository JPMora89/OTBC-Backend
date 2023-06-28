"use strict";

const db = require("../db");
const bcrypt = require("bcrypt");
const { sqlForPartialUpdate } = require("../helpers/sql");
const {
  NotFoundError,
  BadRequestError,
  UnauthorizedError,
} = require("../expressError");

const { BCRYPT_WORK_FACTOR } = require("../config.js");

/** Related functions for users. */

class User {
  /** authenticate user with username, password.
   *
   * Returns { username, first_name, last_name, email, is_admin }
   *
   * Throws UnauthorizedError is user not found or wrong password.
   **/

  static async authenticate(username, password) {
    // try to find the user first
    const result = await db.query(
          `SELECT username,
                  password,
                  first_name AS "firstName",
                  last_name AS "lastName",
                  email,
                  is_admin AS "isAdmin"
           FROM users
           WHERE username = $1`,
        [username],
    );

    const user = result.rows[0];

    if (user) {
      // compare hashed password to a new hash from password
      const isValid = await bcrypt.compare(password, user.password);
      if (isValid === true) {
        delete user.password;
        return user;
      }
    }

    throw new UnauthorizedError("Invalid username/password");
  }

  /** Register user with data.
   *
   * Returns { username, firstName, lastName, email, isAdmin }
   *
   * Throws BadRequestError on duplicates.
   **/

  static async register(
      { username, password, firstName, lastName, email, isAdmin }) {
    const duplicateCheck = await db.query(
          `SELECT username
           FROM users
           WHERE username = $1`,
        [username],
    );

    if (duplicateCheck.rows[0]) {
      throw new BadRequestError(`Duplicate username: ${username}`);
    }

    const hashedPassword = await bcrypt.hash(password, BCRYPT_WORK_FACTOR);

    const result = await db.query(
          `INSERT INTO users
           (username,
            password,
            first_name,
            last_name,
            email,
            is_admin)
           VALUES ($1, $2, $3, $4, $5, $6)
           RETURNING username, first_name AS "firstName", last_name AS "lastName", email, is_admin AS "isAdmin"`,
        [
          username,
          hashedPassword,
          firstName,
          lastName,
          email,
          isAdmin,
        ],
    );

    const user = result.rows[0];

    return user;
  }

  /** Find all users.
   *
   * Returns [{ username, first_name, last_name, email, is_admin }, ...]
   **/

  static async findAll() {
    const result = await db.query(
          `SELECT username,
                  first_name AS "firstName",
                  last_name AS "lastName",
                  email
           FROM users
           ORDER BY username`,
    );

    return result.rows;
  }

  /** Given a username, return data about user.
   *
   * Returns { username, first_name, last_name, is_admin, jobs }
   *   where jobs is { id, title, company_handle, company_name, state }
   *
   * Throws NotFoundError if user not found.
   **/

  // static async get(username) {
  //   const userRes = await db.query(
  //         `SELECT username,
  //                 first_name AS "firstName",
  //                 last_name AS "lastName",
  //                 email
  //          FROM users
  //          WHERE username = $1`,
  //       [username],
  //   );

  //   const user = userRes.rows[0];

  // }
  static async get(username) {
    const userRes = await db.query(
      `SELECT username,
              first_name AS "firstName",
              last_name AS "lastName",
              email
       FROM users
       WHERE username = $1`,
      [username],
    );
  
    const user = userRes.rows[0];
  
    if (!user) throw new NotFoundError(`No user: ${username}`);
  
    return user;
  }
  

  /** Update user data with `data`.
   *
   * This is a "partial update" --- it's fine if data doesn't contain
   * all the fields; this only changes provided ones.
   *
   * Data can include:
   *   { firstName, lastName, password, email, isAdmin }
   *
   * Returns { username, firstName, lastName, email, isAdmin }
   *
   * Throws NotFoundError if not found.
   *
   * WARNING: this function can set a new password or make a user an admin.
   * Callers of this function must be certain they have validated inputs to this
   * or a serious security risks are opened.
   */

  static async update(username, data) {
    if (data.password) {
      data.password = await bcrypt.hash(data.password, BCRYPT_WORK_FACTOR);
    }

    const { setCols, values } = sqlForPartialUpdate(
        data,
        {
          firstName: "first_name",
          lastName: "last_name"
        });
    const usernameVarIdx = "$" + (values.length + 1);

    const querySql = `UPDATE users 
                      SET ${setCols} 
                      WHERE username = ${usernameVarIdx} 
                      RETURNING username,
                                first_name AS "firstName",
                                last_name AS "lastName",
                                email`;
    const result = await db.query(querySql, [...values, username]);
    const user = result.rows[0];

    if (!user) throw new NotFoundError(`No user: ${username}`);

    delete user.password;
    return user;
  }

  /** Delete given user from database; returns undefined. */

  static async remove(username) {
    let result = await db.query(
          `DELETE
           FROM users
           WHERE username = $1
           RETURNING username`,
        [username],
    );
    const user = result.rows[0];

    if (!user) throw new NotFoundError(`No user: ${username}`);
  }

  static async getWatchlist(username) {
    const userRes = await db.query(
      `SELECT id, coin_id, created_at
       FROM watchlist
       WHERE username = $1`,
      [username]
    );

    if (userRes.rows.length === 0) {
      throw new NotFoundError(`Watchlist not found for user: ${username}`);
    }

    return userRes.rows;
  }

  /** Add a coin to the user's watchlist.
   *
   * Returns the newly created watchlist entry:
   *   { id, coin_id, created_at }
   *
   * Throws NotFoundError if user not found or coin already in watchlist.
   **/
  static async addToWatchlist(username, coinId) {
    const duplicateCheck = await db.query(
      `SELECT id
       FROM watchlist
       WHERE username = $1 AND coin_id = $2`,
      [username, coinId]
    );

    if (duplicateCheck.rows[0]) {
      throw new BadRequestError(`Coin already in watchlist`);
    }

    const result = await db.query(
      `INSERT INTO watchlist
       (username, coin_id)
       VALUES ($1, $2)
       RETURNING id, coin_id, created_at`,
      [username, coinId]
    );

    return result.rows[0];
  }

  /** Remove a coin from the user's watchlist.
   *
   * Returns undefined.
   *
   * Throws NotFoundError if user not found or coin not in watchlist.
   **/
  static async removeFromWatchlist(username, coinId) {
    const result = await db.query(
      `DELETE
       FROM watchlist
       WHERE username = $1 AND coin_id = $2
       RETURNING id`,
      [username, coinId]
    );

    if (!result.rows[0]) {
      throw new NotFoundError(`Watchlist entry not found`);
    }
  }

}


module.exports = User;

