passport = require('passport')
User = require('../models/user').User

module.exports.controller -> (app)
  app.get '/users', (req, res) ->

    User.forge({username: un, password: pw}).save().then (model) ->
        passport.authenticate('local') req, res, ->
            res.redirect('/home')
    , (err) ->
        req.flash('error', 'Unable to create account.')
        res.redirect('/register')

    res.send "respond with a resource"
