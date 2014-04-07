// Generated by CoffeeScript 1.7.1
(function() {
  var assert, express, request;

  assert = require("assert");

  request = require('supertest');

  express = require('express');

  describe('GET /users', function() {
    return it('respond with json', function() {
      return request(app).get('/user').set('Accept', 'application/json').expect('Content-Type', /json/).expect(200, done);
    });
  });

}).call(this);
