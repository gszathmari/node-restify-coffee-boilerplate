#
# Controllers
#

Message = require '../models/message'
validate = require '../helpers/validate'

# Route: GET [/]
exports.index = (req, res, next) ->
  myMessage = "Hello World!"
  res.json Message.retrieve myMessage
  return next()

# Route: POST [/]
exports.reflector = (req, res, next) ->
  # Prepare error message for validation errors
  validationErrorMsg =
    code: "ValidationError"
    message: "There was a problem with one of the submitted parameters"
    errors: new Array

  # Validate 'm' parameter
  result = validate.message req.params.m
  # If 'm' is invalid, construct error message and send it back
  validationErrorMsg.errors.push result if result

  # Send error back and stop processing the request if we have erros
  if validationErrorMsg.errors.length > 0
    res.send 400, validationErrorMsg
    return next false

  # Construct response and send it back if 'm' parameter was valid
  res.json Message.retrieve req.params.m
  return next()
