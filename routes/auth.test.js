// const request = require('supertest');
// const app = require('../app'); // Assuming your Express app is exported from 'app.js'
// const { createToken } = require('../helpers/tokens');
// const User = require('../models/user');

// describe('Authentication Endpoints', () => {
//   test('POST /auth/token - should return JWT token on successful login', async () => {
//     // Create a test user
//     const testUser = {
//       username: 'testuser',
//       password: 'testpassword',
//       firstName: 'Test',
//       lastName: 'User',
//       email: 'testuser@example.com',
//     };

//     // Register the test user to get a token
//     const registerResponse = await request(app)
//       .post('/auth/register')
//       .send({ user: testUser });
//     expect(registerResponse.status).toBe(201);
//     expect(registerResponse.body).toHaveProperty('token');
//     const token = registerResponse.body.token;

//     // Make a login request with the token
//     const loginResponse = await request(app)
//       .post('/auth/token')
//       .send({ username: testUser.username, password: testUser.password });
//     expect(loginResponse.status).toBe(200);
//     expect(loginResponse.body).toHaveProperty('token');
//     expect(loginResponse.body.token).toBe(token); // The token should be the same as the one obtained during registration
//   });

//   test('POST /auth/token - should return 400 with invalid credentials', async () => {
//     const invalidCredentials = {
//       username: 'nonexistentuser',
//       password: 'wrongpassword',
//     };

//     const response = await request(app)
//       .post('/auth/token')
//       .send(invalidCredentials);
//     expect(response.status).toBe(400);
//     expect(response.body.message).toBe('Invalid credentials');
//   });

//   // Add more test cases for other scenarios, such as invalid input data, etc.

//   // Cleanup: Delete the test user after tests are done
//   afterAll(async () => {
//     await User.remove(testUser.username);
//   });
// });


"use strict";

const request = require("supertest");

const app = require("../app");

const {
  commonBeforeAll,
  commonBeforeEach,
  commonAfterEach,
  commonAfterAll,
} = require("./_testCommon");

beforeAll(commonBeforeAll);
beforeEach(commonBeforeEach);
afterEach(commonAfterEach);
afterAll(commonAfterAll);

/************************************** POST /auth/token */

describe("POST /auth/token", function () {
  test("works", async function () {
    const resp = await request(app)
        .post("/auth/token")
        .send({
          username: "u1",
          password: "password1",
        });
    expect(resp.body).toEqual({
      "token": expect.any(String),
    });
  });

  test("unauth with non-existent user", async function () {
    const resp = await request(app)
        .post("/auth/token")
        .send({
          username: "no-such-user",
          password: "password1",
        });
    expect(resp.statusCode).toEqual(401);
  });

  test("unauth with wrong password", async function () {
    const resp = await request(app)
        .post("/auth/token")
        .send({
          username: "u1",
          password: "nope",
        });
    expect(resp.statusCode).toEqual(401);
  });

  test("bad request with missing data", async function () {
    const resp = await request(app)
        .post("/auth/token")
        .send({
          username: "u1",
        });
    expect(resp.statusCode).toEqual(400);
  });

  test("bad request with invalid data", async function () {
    const resp = await request(app)
        .post("/auth/token")
        .send({
          username: 42,
          password: "above-is-a-number",
        });
    expect(resp.statusCode).toEqual(400);
  });
});

/************************************** POST /auth/register */

describe("POST /auth/register", function () {
  test("works for anon", async function () {
    const resp = await request(app)
        .post("/auth/register")
        .send({
          username: "new",
          firstName: "first",
          lastName: "last",
          password: "password",
          email: "new@email.com",
        });
    expect(resp.statusCode).toEqual(201);
    expect(resp.body).toEqual({
      "token": expect.any(String),
    });
  });

  test("bad request with missing fields", async function () {
    const resp = await request(app)
        .post("/auth/register")
        .send({
          username: "new",
        });
    expect(resp.statusCode).toEqual(400);
  });

  test("bad request with invalid data", async function () {
    const resp = await request(app)
        .post("/auth/register")
        .send({
          username: "new",
          firstName: "first",
          lastName: "last",
          password: "password",
          email: "not-an-email",
        });
    expect(resp.statusCode).toEqual(400);
  });
});
