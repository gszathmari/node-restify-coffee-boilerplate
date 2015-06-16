#
# Models
#

# This dummy model will construct a response in JSON format from
# a user submitted string
class Message
  constructor: ->
  
  retrieve: (m) ->
    response =
      message: m
    return response

# Create object and export it as a dummy model
message = new Message

module.exports = message
