gulp = require "gulp"
config = require "./config"
error = require "./error"

gulp.task "wiredep", ->
  wiredep = require("wiredep").stream

  gulp.src config.dev.styles.scss.main
    .pipe wiredep(config.options.bower)
    .pipe gulp.dest(config.dev.styles.root)

  # gulp.src config.dev.html.main
  gulp.src "app/index.html"
    .pipe wiredep(config.options.bower)
    # .pipe wiredep(
    #   directory: config.options.bower.directory
    #   bowerJson: require('./../bower.json')
    #   verbose: true
    #   exclude: ["modernizr"]
    # )
    .pipe gulp.dest("app")