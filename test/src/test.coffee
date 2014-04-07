assert = require("assert")
request = require('supertest')
express = require('express');

describe 'GET /users', ->
  it 'respond with json', ->
    request(app)
      .get('/user')
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(200, done)
