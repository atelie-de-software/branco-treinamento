require './src/game'

RSpec.describe Game do
  describe "move to right" do
    let(:game) { Game.new }

    it do
      initial_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        "M    "
      expect(game.screen).to eq(initial_screen)
      game.right

      expected_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        " M   "
      expect(game.screen).to eq(expected_screen)
    end
  end

  describe "move to a rock" do
    let(:game) { Game.new }

    it do
      initial_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        "  M  "
      expect(game.screen).to eq(initial_screen)
      game.right
      game.right
      game.up

      expected_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==M==\n" +
        "     "
      expect(game.screen).to eq(expected_screen)
    end
  end

  describe "fall into water" do
    let(:game) { Game.new }

    xit 'moving up' do
      initial_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        "M    "
      expect(game.screen).to eq(initial_screen)
      game.up

      expected_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "X=O==\n" +
        "DEATH"
      expect(game.screen).to eq(expected_screen)
    end

    context 'when frog on rock' do
      xit 'must die when moving left' do
        game.right
        game.right
        game.up
        game.up
        game.left

        expected_screen =
          ":::::\n" +
          "==O==\n" +
          "=XO==\n" +
          "==O==\n" +
          "DEATH"

        expect(game.screen).to eq(expected_screen)
      end

      xit 'moving right' do
        game.right
        game.right
        game.up
        game.up
        game.right

        expected_screen =
          ":::::\n" +
          "==O==\n" +
          "==OX=\n" +
          "==O==\n" +
          "DEATH"

        expect(game.screen).to eq(expected_screen)
      end
    end
  end

  describe "win the game" do
    let(:game) { Game.new }

    xit do
      game.right
      game.right
      game.up
      game.up
      game.up
      game.up

      expected_screen =
        "::M::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        " WIN "
      expect(game.screen).to eq(expected_screen)
    end
  end
end
