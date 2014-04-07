
###
Module dependencies.
###
express = require("express")
http = require("http")
path = require("path")
app = express()
fs = require("fs")
Bookshelf = require('bookshelf')
Passport = require('passport')
flash = require('connect-flash')

# all environments
app.set "port", process.env.PORT or 3000

app.set "views", path.join(__dirname, "views")
app.set "view engine", "jade"

app.use express.favicon()
app.use express.logger("dev")
app.use express.json()
app.use express.urlencoded()
app.use express.methodOverride()

app.use express.cookieParser()
app.use express.bodyParser()
app.use expressValidator()
app.use express.session( secret: 'steve the tv' )

app.use Passport.initialize()
app.use Passport.session()
app.use flash()

app.use app.router
app.use express.static(path.join(__dirname, "public"))

# development only
app.use express.errorHandler()  if "development" is app.get("env")

# dynamically include controllers
fs.readdirSync( path.join(__dirname, './controllers') ).forEach (file) ->
  if file.substr is '.js'
    route = require( path.join(__dirname, './controllers' + file))
    route.controller app

require('./util/bookshelf')(Bookshelf);
require('./util/auth')(Passport);

http.createServer(app).listen app.get("port"), ->
  console.log "Express server listening on port " + app.get("port")
  return
