#
# Routes
#

app = module.parent.exports.app

main = require './controllers/main'

# Route: HEAD [/]
app.head '/', main.index

# Route: GET [/]
app.get '/', main.index

# Route: POST [/]
app.post '/', main.reflector
