gulp = require "gulp"

gulp.task "clean", (done) ->
  del = require "del"
  config = require "./config"

  del([config.tmp.root, config.build.root], done)
