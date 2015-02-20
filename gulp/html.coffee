gulp = require "gulp"
config = require "./config"
error = require "./error"

gulp.task "html", ->
  if config.options.use.mainBower
    mainBowerFiles = require "main-bower-files"
    files = mainBowerFiles()