rootPath =
  build: process.env.DIR ? "dist"
  dev: "app"
  tmp: "app"

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
    root: "#{root}/lib"
    all: "#{root}/lib/**/*.coffee"
    main: "#{root}/lib/game/index.coffee"
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