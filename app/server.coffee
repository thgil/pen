
###
Module dependencies.
###
express = require 'express'
http = require 'http'
path = require 'path'
fs = require 'fs'
Bookshelf = require 'bookshelf'
Passport = require 'passport'
flash = require 'connect-flash'

app = express()

# all environments
app.set "port", process.env.PORT or 3000

app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"

app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()

# app.use express.session( secret: 'steve the tv' )

app.use Passport.initialize()
app.use Passport.session()
app.use flash()

app.use app.router
app.use express.static(path.join(__dirname, "public"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")

require('./util/bookshelf')(Bookshelf);
require('./util/auth')(Passport);

# dynamically include controllers

# fs.readdirSync( __dirname + '/controllers' ).forEach (file) ->
#   if file.substr(-7) is '.coffee'
#     route = require('./controllers/' + file )(app)
#     # route(app)

require('./controllers/index')(app);

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
  return

module.exports = app;
