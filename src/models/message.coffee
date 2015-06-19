#
# Models
#

# This dummy model will construct a response in JSON format from
# a user submitted string

class Message
  constructor: ->

  retrieve: (m, callback) ->
    err = null
    # Construct reply object
    response =
      message: m
    # Send result back through the callback
    callback err, response

module.exports = new Message
