supertest = require 'supertest'

config = require '../src/helpers/config'
app = require '../src/server'

port = process.env.PORT or config.general.server.port
api = supertest 'http://localhost:' + port

# Test HTTP HEAD route
describe 'Route: HEAD /', ->
  it 'should return HTTP 204', (done) ->
    api.head '/'
      .expect 204, done

# Test main (/) route
describe 'Route: GET /', ->
  it 'should return HTTP 200', (done) ->
    api.get '/'
      .expect 'Content-Type', /json/
      .expect 200, done
