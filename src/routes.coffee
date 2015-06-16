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

# Route: '/'
app.get '/', main.index
