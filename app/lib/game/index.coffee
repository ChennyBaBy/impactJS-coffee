ig.module("game.main")
  .requires("impact.game", "impact.font", "plusplus.core.plusplus")
  .defines ->
    MyGame = ig.Game.extend
      font: new ig.Font "media/04b03.font.png"
      init: ->
      update: ->
        @parent()
      draw: ->
        @parent()
        x = ig.system.width / 2
        y = ig.system.height / 2
        @font.draw("it works with coffeescript!", x, y, ig.Font.ALIGN.CENTER)

    ig.main("#canvas", MyGame, 60, 320, 240, 2)

console.log "here?"
