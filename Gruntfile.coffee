
module.exports = (grunt) ->

  # // show elapsed time at the end
  # require('time-grunt')(grunt)
  #
  # # // load all grunt tasks
  # require('load-grunt-tasks')(grunt)
  #
  # reloadPort = 35729

  grunt.initConfig
    # pkg: grunt.file.readJSON('package.json')

    # develop:
    #   server:
    #     file: 'app.coffee'
    #     cmd: 'coffee'

    express:
      options:
        cmd: 'coffee'

      dev:
        options:
          script: 'app/server.coffee'
      #
      # prod:
      #   options:
      #     script: 'app/server.coffee'
      #     node_env: 'production'
      #
      # test:
      #   options:
      #     script: 'app/server.coffee'

    watch:
      express:
        files:  [ 'app/**/*.coffee' ]
        tasks:  [ 'express:dev' ]
        options:
          spawn: false
          livereload: true

      # js:
      #   files: ['public/js/*.js']
      #   options:
      #     livereload: reloadPort
      #
      # css:
      #   files: ['public/css/*.css']
      #   options:
      #     livereload: reloadPort
      #
      # views:
      #   files: [ 'app/views/**/*.jade' ]
      #   options:
      #     livereload: reloadPort

  grunt.loadNpmTasks('grunt-express-server');
  grunt.loadNpmTasks('grunt-contrib-watch');

  grunt.registerTask('default', ['express:dev', 'watch'])
