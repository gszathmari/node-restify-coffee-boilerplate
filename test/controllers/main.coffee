chai = require 'chai'
sinon = require 'sinon'

main = require '../../src/controllers/main'

expect = chai.expect

describe 'Controller: main', ->
  # Message from main controller
  myMessage = "Hello World!"
  myJsonMessage =
    message: myMessage
  # Stub request and response objects
  req = sinon.spy()
  res =
    json: sinon.spy()
  next = sinon.spy()

  it 'should return the Hello World! message', ->
    r = main.index req, res, next
    expect(req.called).be.false
    expect(res.json.calledOnce).be.true
    expect(res.json.calledWith myJsonMessage).be.true
    expect(next.calledOnce).be.true

  after ->
    req.reset()
    res.json.reset()
    next.reset()
