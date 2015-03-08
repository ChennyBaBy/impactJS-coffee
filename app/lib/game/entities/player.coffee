ig.module( "game.entities.player" )
  .requires(
    "plusplus.abstractities.player"
  )
  .defines ->
    ig.EntityPlayer = ig.global.EntityPlayer = ig.Player.extend(
      animSheet:
        new ig.AnimationSheet( "media/alienPink.png", 66, 92)
      animInit:
        "idleX"
      animSettings:
        idleX:
          sequence: [0]
          frameTime: 0.1
      size:
        x: 66
        y: 92
    )