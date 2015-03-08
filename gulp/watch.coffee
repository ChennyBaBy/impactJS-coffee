browserSync = require "browser-sync"
gulp = require "gulp"
config = require "./config"
reload = browserSync.reload

gulp.task "serve", ->
  console.log config.options.browserSync
  browserSync.init(config.options.browserSync)

gulp.task "watch", ["styles", "coffee", "serve"], ->
  gulp.watch(config.dev.styles.scss.all, ["styles", reload])
  gulp.watch(config.dev.scripts.all, ["coffee", reload])
  gulp.watch(config.dev.images.all, ["images", reload])
