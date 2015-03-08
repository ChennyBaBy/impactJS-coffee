ig.module("game.main").requires("plusplus.core.plusplus", "game.levels.test").defines(function() {
  var MyGame;
  MyGame = ig.GameExtended.extend({
    font: new ig.Font("media/font2.png"),
    init: function() {
      this.parent();
      return this.loadLevel(ig.global.LevelTest);
    },
    update: function() {
      return this.parent();
    },
    draw: function() {
      return this.parent();
    }
  });
  return ig.main("#canvas", MyGame, 60, 320, 240, 1, ig.LoaderExtended);
});

console.log("here?");
