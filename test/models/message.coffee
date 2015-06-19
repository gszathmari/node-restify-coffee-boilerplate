chai = require 'chai'

Message = require '../../src/models/message'

expect = chai.expect

describe 'Model: Message', ->
  m = "I am a teapot!"

  it 'should return our message in JSON', ->
    Message.retrieve m, (err, myMessage) ->
      expect(err).to.be.null
      expect(myMessage).to.have.property('message')
      expect(myMessage.message).to.be.a('string')
      expect(myMessage.message).to.be.equal(m)
