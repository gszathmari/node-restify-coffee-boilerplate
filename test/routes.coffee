supertest = require 'supertest'
chai = require 'chai'

config = require '../src/helpers/config'
app = require '../src/server'

port = process.env.PORT or config.general.server.port
api = supertest 'http://localhost:' + port

chai.should()

# Test HTTP HEAD route
describe 'Route: HEAD [/]', ->
  it 'should return HTTP 200', (done) ->
    api.head '/'
      .expect 200, done

# Test GET [/] route
describe 'Route: GET [/]', ->
  it 'should return HTTP 200', (done) ->
    api.get '/'
      .set 'Origin', 'example.com'
      .expect 'Access-Control-Allow-Origin', 'example.com'
      .expect 'Content-Type', /json/
      .expect 200, done

# Test POST [/] route
describe 'Route: POST [/]', ->
  it 'should reflect valid messages', (done) ->
    message = "I am a teapot"
    api.post '/'
      .query {m: message}
      .set 'Origin', 'example.com'
      .expect 'Access-Control-Allow-Origin', 'example.com'
      .expect 200
      .end (err, res) ->
        return done err if err
        res.body.should.have.property('message')
        res.body.message.should.equal(message)
        done()

  it 'should reject invalid messages', (done) ->
    message = "x"
    api.post '/'
      .query {m: message}
      .set 'Origin', 'example.com'
      .expect 'Access-Control-Allow-Origin', 'example.com'
      .expect 400
      .end (err, res) ->
        return done err if err
        res.body.should.have.property('code')
        res.body.code.should.equal('ValidationError')
        res.body.should.have.property('message')
        res.body.should.have.property('errors')
        res.body.errors.should.be.an('array')
        res.body.errors.should.have.length(1)
        done()
