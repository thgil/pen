passport = require('passport')
User = require('../models/user').User

module.exports = (app) ->
  app.get '/users', (req, res) ->
    res.send('users')
    # User.forge({username: un, password: pw}).save().then (model) ->
    #     passport.authenticate('local') req, res, ->
    #         res.redirect('/home')
    # , (err) ->
    #     req.flash('error', 'Unable to create account.')
    #     res.redirect('/register')
    #
    # res.send(200, { name: 'tobi' });
