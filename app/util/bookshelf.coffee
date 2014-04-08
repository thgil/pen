module.exports = (BookShelf) ->
  BookShelf.PG = BookShelf.initialize
    client: 'pg',
    connection:
      host: 'localhost'
      user: 'psql'
      password: ''
      database: 'pen'
