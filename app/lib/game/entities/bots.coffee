ig.module("game.entities.bots")
  .requires(
    "plusplus.abstractities.character"
  )
  .defines ->
    ig.EntityBots = ig.global.EntityBots = ig.Character.extend(
      animSheet:
        new ig.AnimationSheet( "media/dummy.png", 32, 32)
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