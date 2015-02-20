rootPath =
  build: process.env.DIR ? "dist"
  dev: "app"
  tmp: "tmp"

paths = (env) ->
  root = rootPath[env]
  root: root
  styles:
    root: "#{root}/styles"
    scss:
      all: "#{root}/styles/*.scss"
      main: "#{root}/styles/main.scss"
    css:
      all: "#{root}/styles/**/*.css"
      main: "#{root}/styles/main.css"
  scripts:
    root: "#{root}/scripts"
    all: "#{root}/scripts/**/*.coffee"
    main: "#{root}/scripts/index.coffee"
  html:
    all: "#{root}/*.html"
    main: "#{root}/index.html"
  fonts:
    root: "#{root}/fonts"
    all: "#{root}/**/*.{eot,svg,ttf,woff}"
  images:
    root: "#{root}/images"
    all: "#{root}/images/**/*"

config =
  dev: paths("dev")
  tmp: paths("tmp")
  build: paths("build")

  options:
    rubySass:
      entry: paths("dev").styles.scss.main
      options:
        sourcemap: true
    browserify:
      entry: paths("dev").scripts.main
      extensions: [".coffee", ".html"]
      cache: {}
      packageCache: {}
      debug: true
      fullPaths: true
    browserSync:
      open: true
      port: 9000
      files:
        [
          "#{paths("tmp").root}/**/*.{js,css}",
          "#{paths("dev").root}/**/*.{js,css,html}"
        ]
      server:
        baseDir: [paths("dev").root, paths("tmp").root]
    bower:
      bowerrc: ".bowerrc"
      directory: "#{paths("dev").root}/bower_components"
      exclude: ["modernizr"]
      verbose: true

module.exports = config

# module.exports =
#   dev:
#     root: "#{devDir}"
#     files:
#       scss        : "#{devDir}/styles/*.scss"
#       scssMain    : "#{devDir}/styles/main.scss"
#       css         : "#{devDir}/styles/**/*.css"
#       js          : "#{devDir}/scripts/**/*.js"
#       coffee      : "#{devDir}/scripts/**/*.coffee"
#       coffeeEntry : "#{devDir}/scripts/main.coffee"
#       html        : "#{devDir}/*.html"
#       fonts       : "#{devDir}/**/*.{eot,svg,ttf,woff}"
#     folders:
#       scripts : "#{devDir}/scripts"
#       styles  : "#{devDir}/styles"
#       image   : "#{devDir}/images/**/*"
#       fonts   : "#{devDir}/fonts/**/*"

#   preview:
#     root: "#{previewDir}"
#     files:
#       css   : "#{previewDir}/styles/**/*.css"
#       fonts : "#{previewDir}/styles/fonts/*"
#       js    : "#{previewDir}/scripts/**/*.js"
#     folders:
#       styles  : "#{previewDir}/styles"
#       fonts   : "#{previewDir}/styles/fonts"
#       scripts : "#{previewDir}/scripts"

#   build:
#     root    : "#{buildDir}"
#     folders:
#       fonts   : "#{buildDir}/fonts"
#       image   : "#{buildDir}/images"
#       scripts : "#{buildDir}/scripts"
#       styles  : "#{buildDir}/styles"

#   bowerPaths:
#     bowerDirectory : "#{devDir}/bower_components"
#     bowerrc        : ".bowerrc"
#     bowerJson      : "bower.json"

#   rubySassOptions :
#     style      : "expanded"
#     precision  : 10
#     compass    : true
#     bundleExec : true

#   coffeeOptions :
#     bare: true

#   imageminOptions :
#     optimizationLevel : 3
#     progressive       : true
#     interlaced        : true