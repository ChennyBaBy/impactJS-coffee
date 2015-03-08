gulp = require "gulp"
config = require "./config"
browserify = require "browserify"
source = require "vinyl-source-stream"
production = config.env is "production"
error = require "./error"
coffeeify = require "coffeeify"

gulp.task "bundle", ->
  bOptions = config.options.browserify

  if production
    bOptions.debug = false
    bOptions.fullPaths = false

  b = browserify(bOptions)
    .add("./#{config.options.browserify.entry}")
    .transform(coffeeify)

  bundle = ->
    b
      .bundle()
      .on("error", error.notify)
      .pipe(source("index.js"))
      .pipe(gulp.dest(config.tmp.scripts.root))

  unless production
    b.on("update", bundle)

  bundle()


coffee = require "gulp-coffee"

gulp.task "coffee", ->
  gulp.src "#{config.dev.scripts.all}"
    .pipe coffee bare: true
    .pipe gulp.dest "#{config.tmp.scripts.root}"