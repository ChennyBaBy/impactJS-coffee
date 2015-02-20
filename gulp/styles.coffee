gulp = require "gulp"
$ = do require "gulp-load-plugins"

gulp.task "styles", ->
  config = require "./config"
  error = require "./error"

  $.rubySass(config.options.rubySass.entry, config.options.rubySass.options)
    .on("error", error.notify)
    .pipe(gulp.dest config.tmp.styles.root)
    .pipe($.size(title: "styles"))