chai = require 'chai'

Message = require '../../src/models/message'

expect = chai.expect

describe 'Model: Message', ->
  myMessage = "I am a teapot!"

  it 'should return our message in JSON', ->
    result = Message.retrieve myMessage
    expect(result).to.have.property('message')
    expect(result.message).to.be.a('string')
    expect(result.message).to.be.equal(myMessage)
