#
# Main API Server
#

restify = require 'restify'
chalk = require 'chalk'

config = require './helpers/config'
exceptionHandler = require './helpers/exceptionhandler'
logger = require './helpers/logger'

app = module.exports = restify.createServer()
env = process.env.NODE_ENV or "development"

# Prevents leaking internal errors through the API
app.on 'uncaughtException', exceptionHandler

# For handling trailing slashes
app.pre restify.pre.sanitizePath()

app.use restify.bodyParser()
app.use restify.queryParser()

# Launching server
server = app.listen process.env.PORT or 5000, ->
  address = server.address().address
  port = server.address().port
  logger.info \
    chalk.green "Server listening on http://#{address}:#{port} " +
    chalk.grey "(PID: #{process.pid})"

module.exports.app = app
routes = require './routes'
