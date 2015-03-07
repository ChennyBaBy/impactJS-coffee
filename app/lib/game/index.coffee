ig.module("game.main")
  .requires(
    "plusplus.core.plusplus",
    "game.levels.test"
    )
  .defines ->
    MyGame = ig.GameExtended.extend
      font: new ig.Font "media/font2.png"
      init: ->
      update: ->
        @parent()
      draw: ->
        @parent()
        x = ig.system.width / 2
        y = ig.system.height / 2
        @font.draw("it works with coffeescript!", x, y, ig.Font.ALIGN.CENTER)

    ig.main("#canvas", MyGame, 60, 320, 240, 1, ig.LoaderExtended)

console.log "here?"
