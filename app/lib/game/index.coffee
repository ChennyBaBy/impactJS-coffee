ig.module("game.main")
  .requires("impact.game", "impact.font")
  .defines ->
    MyGame = ig.Game.extend
      font: new ig.Font "media/04b03.font.png"
      init: ->
        console.log "init"
      update: ->
        console.log "update"
        @parent()
      draw: ->
        console.log "draw"
        @parent()
        x = ig.system.width / 2
        y = ig.system.height / 2
        console.log @font
        console.log "here???"
        @font.draw("it works!", x, y, ig.Font.ALIGN.CENTER)

    ig.main("#canvas", MyGame, 60, 320, 240, 2)

console.log "here?"
