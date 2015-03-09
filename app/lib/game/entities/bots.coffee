ig.module("game.entities.Character")
  .requires(
    "plusplus.abstractities.character"
  )
  .defines ->
    ig.EntityBot = ig.global.EntityBot = ig.Character.extend(
      animSheet:
        new ig.AnimationSheet( "media/bot.png", 32, 32)
      animInit:
        "idleX"
      animSettings:
        idleX:
          sequence: [0]
          frameTime: 0.1
      size:
        x: 32
        y: 32
      gravityFactor: 0.8
    )