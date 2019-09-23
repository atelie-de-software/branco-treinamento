require './src/game'

RSpec.describe Game do
  describe "move to right" do
    let(:game) { Game.new }

    it '' do
      initial_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        "Q    "
      expect(game.screen).to eq(initial_screen)
      game.direita

      waited_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        " Q   "
      expect(game.screen).to eq(waited_screen)
    end

  end
end
