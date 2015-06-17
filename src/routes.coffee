#
# Routes
#

restify = require 'restify'

app = module.parent.exports.app

main = require './controllers/main'
config = require './helpers/config'
addHeaders = require './middlewares/addheaders'

corsOptions =
  origins: config.general.CORS.allowed_origins

app.use restify.CORS corsOptions
app.use addHeaders

# Handle HEAD requests
app.head '/.*', (req, res, next) ->
  res.send(204)
  next(false)

# Route: GET [/]
app.get '/', main.index

# Route: POST [/]
app.post '/', main.reflector
