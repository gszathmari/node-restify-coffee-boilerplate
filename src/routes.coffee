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
# Workaround for cURL
app.pre restify.pre.userAgentConnection()

# Route: HEAD [/]
app.head '/', main.index

# Route: GET [/]
app.get '/', main.index

# Route: POST [/]
app.post '/', main.reflector
