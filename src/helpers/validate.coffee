validator = require 'validator'

# Validate 'm' parameter for length and format
exports.message = (m, min = 3, max = 250) ->
  unless validator.isLength m, min, max
    error =
      field: "m"
      message: "Parameter must be between #{min} and #{max} characters"
    return error
  else
    return null
