browserSync = require "browser-sync"
gulp = require "gulp"
config = require "./config"
reload = browserSync.reload

gulp.task "serve", ->
  console.log config.options.browserSync
  browserSync.init(config.options.browserSync)

gulp.task "watch", ["styles", "bundle", "serve"], ->
  gulp.watch(config.dev.styles.scss.all, ["styles", reload])
  gulp.watch(config.dev.scripts.all, ["bundle", reload])
  gulp.watch(config.dev.images.all, ["images", reload])
