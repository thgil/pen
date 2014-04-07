PG = require('bookshelf').PG;

module.exports = ->
  User = PG.Model.extend({
    tableName: 'users'
  });
