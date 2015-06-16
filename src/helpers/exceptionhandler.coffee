#
# Catches all unhandled exceptions
#
logger = require './logger'

exceptionHandler = (req, res, route, err) ->
  logger.error "Exception caught! Error message: #{err.message}"
  response =
    message: "InternalServerError"
    desription: "Ouch! Internal server error, please try again"
  res.json 500, response
  throw new Error "Uncaught Exception"

module.exports = exceptionHandler
