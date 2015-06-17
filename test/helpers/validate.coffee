chai = require 'chai'

validate = require '../../src/helpers/validate'

expect = chai.expect

describe 'Helper: validate', ->
  it 'should accept valid messages', ->
    m = "I am a teapot"
    result = validate.message m
    expect(result).to.be.null

  it 'should reject invalid messages', ->
    m = "x"
    result = validate.message m
    expect(result).to.be.an('object')
    expect(result).to.have.property('field')
    expect(result.field).to.equal("m")
    expect(result).to.have.property('message')
    expect(result.message).to.contain('Parameter must be between')
