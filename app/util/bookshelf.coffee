module.exports = (BookShelf) ->
  BookShelf.PG = BookShelf.initialize
    client: 'pg',
    connection:
      host: 'localhost'
      user: 'username'
      password: 'password'
      database: 'dbname'
