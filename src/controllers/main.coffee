#
# Controllers
#

Message = require '../models/message'

# Route: '/'
exports.index = (req, res, next) ->
  myMessage = "Hello World!"
  res.json Message.retrieve myMessage
  return next()
