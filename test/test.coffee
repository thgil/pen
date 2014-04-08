chai = require 'chai'
request = require 'supertest'
app = require '../app/server'

describe 'GET /users', ->
  it 'respond with json', (done) ->
    request(app)
      .get('/user')
      .set('Accept', 'application/json')
      .expect('Content-Type', /json/)
      .expect(200, done)
