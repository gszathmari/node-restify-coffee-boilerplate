#
# Controllers
#

Message = require '../models/message'
validate = require '../helpers/validate'

# Route: GET [/]
exports.index = (req, res, next) ->
  myMessage =
    message: "Hello World!"
  res.json myMessage
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
    res.json 400, validationErrorMsg
    return next false

  # We consider user submitted 'm' parameter as "clean" from here

  # Construct response and return it back to the client
  Message.retrieve req.params.m, (err, myMessage) ->
    # Model can also generate errors
    if err
      return next err
    # Return response
    else
      res.json myMessage
      return next()
