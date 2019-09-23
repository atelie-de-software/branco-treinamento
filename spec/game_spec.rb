require './src/game'

RSpec.describe Game do
  describe "move to right" do
    let(:game) { Game.new }

    xit do
      initial_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        "M    "
      expect(game.screen).to eq(initial_screen)
      game.right

      waited_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        " M   "
      expect(game.screen).to eq(waited_screen)
    end
  end

  describe "move to a rock" do
    let(:game) { Game.new }

    xit do
      initial_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        "  M  "
      expect(game.screen).to eq(initial_screen)
      game.right

      waited_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==M==\n" +
        "     "
      expect(game.screen).to eq(waited_screen)
    end
  end

  describe "fall into water" do
    let(:game) { Game.new }
    initial_screen =
    ":::::\n" +
    "==O==\n" +
    "==O==\n" +
    "==O==\n" +
    "M    "

    xit 'move to up' do
      expect(game.screen).to eq(initial_screen)
      game.up

      waited_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "X=O==\n" +
        "     "
      expect(game.screen).to eq(waited_screen)
    end
  end

  describe "win the game" do
    let(:game) { Game.new }

    xit do
      initial_screen =
        ":::::\n" +
        "==M==\n" +
        "==O==\n" +
        "==O==\n" +
        "     "
      expect(game.screen).to eq(initial_screen)
      game.up

      waited_screen =
        "::M::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        "     "
      expect(game.screen).to eq(waited_screen)
    end
  end
end
