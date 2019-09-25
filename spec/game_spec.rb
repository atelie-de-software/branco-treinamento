require './src/game'

RSpec.describe Game do
  let!(:game) { Game.new }

  describe 'initial screen' do
    it 'is correct' do
      expected_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        "M    "
      expect(game.screen).to eq(expected_screen)
    end
  end

  describe 'frog moves to the right' do
    subject { game.right }

    it 'responds correctly' do
      subject

      expected_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        " M   "
      expect(game.screen).to eq(expected_screen)
    end
  end

  describe 'frog moves to a plant' do
    subject do
      game.right
      game.right
      game.up
    end

    it 'responds correctly' do
      subject
      expected_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==B==\n" +
        "     "
      expect(game.screen).to eq(expected_screen)
    end
  end

  describe 'frog falling into water' do
    context 'from beginning of the game' do
      it 'dies moving up' do
        game.up

        expected_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "X=O==\n" +
        "DEATH"
        expect(game.screen).to eq(expected_screen)
      end
    end

    context 'from a plant' do
      subject(:moves_to_plant) do
        game.right
        game.right
        game.up
        game.up
      end

      it 'dies moving left' do
        moves_to_plant
        game.left

        expected_screen =
          ":::::\n" +
          "==O==\n" +
          "=XO==\n" +
          "==O==\n" +
          "DEATH"

        expect(game.screen).to eq(expected_screen)
      end

      it 'die moving right' do
        moves_to_plant
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

  describe 'plant movement' do
    context 'after 10 ticks' do
      it 'the plants should move' do
        10.times do
          game.tick
        end
        expected_screen =
          ":::::\n" +
          "===O=\n" +
          "=O===\n" +
          "===O=\n" +
          "M    "
        expect(game.screen).to eq(expected_screen)
      end
    end

    context 'after 20 ticks' do
      it 'the plants should have on the borders' do
        20.times do
          game.tick
        end
        expected_screen =
          ":::::\n" +
          "====O\n" +
          "O====\n" +
          "====O\n" +
          "M    "
        expect(game.screen).to eq(expected_screen)
      end
    end

    context 'after 30 ticks' do
      it 'the plants should move back' do
        30.times do
          game.tick
        end
        expected_screen =
          ":::::\n" +
          "===O=\n" +
          "=O===\n" +
          "===O=\n" +
          "M    "
        expect(game.screen).to eq(expected_screen)
      end
    end
  end

  describe 'frog is on the plant' do
    it 'moves with a plant' do
      game.right
      game.right
      game.up
      10.times do
        game.tick
      end

      expected_screen =
        ":::::\n" +
        "===O=\n" +
        "=O===\n" +
        "===B=\n" +
        "     "
      expect(game.screen).to eq(expected_screen)
    end
  end

  describe 'victory' do
    subject(:wins_the_game) do
      game.right
      game.right
      game.up
      game.up
      game.up
      game.up
    end

    it 'shows victory screen' do
      wins_the_game
      expected_screen =
        "::W::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        " WIN "
      expect(game.screen).to eq(expected_screen)
    end
  end

  describe 'second level' do
    xit 'renders new level with moving cars' do
      game.right
      game.right
      game.up
      game.up
      game.up
      game.up
      
      5.times do
        game.tick
      end

      expected_screen =
        ":::::\n" +
        "___Q_\n" +
        "_C___\n" +
        "___Q_\n" +
        "  M  "
      expect(game.screen).to eq(expected_screen)

      expected_screen =
        ":::::\n" +
        "__Q__\n" +
        "__C__\n" +
        "__Q__\n" +
        "  E  "

      8.times do
        game.tick
      end

      expect(game.screen).to eq(expected_screen)
    end

    xit 'after a while cars disapear from one side and apear at the other' do
      game.right
      game.right
      game.up
      game.up
      game.up
      game.up
      
      5.times do
        game.tick
      end

      (8*3).times do
        game.tick
      end

      expected_screen =
        ":::::\n" +
        "Q____\n" +
        "____C\n" +
        "Q____\n" +
        "  E  "
      expect(game.screen).to eq(expected_screen)

      (8).times do
        game.tick
      end

      expected_screen =
        ":::::\n" +
        "____Q\n" +
        "C____\n" +
        "____Q\n" +
        "  E  "
      expect(game.screen).to eq(expected_screen)
    end

    xit 'frog dies if hit by a car coming from the right' do
      game.right
      game.right
      game.up
      game.up
      game.up
      game.up
      
      5.times do
        game.tick
      end

      game.up

      expected_screen =
        ":::::\n" +
        "___Q_\n" +
        "_C___\n" +
        "__SQ_\n" +
        "     "
      expect(game.screen).to eq(expected_screen)

      8.times do
        game.tick
      end

      expected_screen =
        ":::::\n" +
        "__Q__\n" +
        "__C__\n" +
        "__X__\n" +
        "DEATH"
      expect(game.screen).to eq(expected_screen)
    end

    xit 'frog dies if hit by a car coming from the left' do
      game.right
      game.right
      game.up
      game.up
      game.up
      game.up
      
      5.times do
        game.tick
      end

      game.up
      game.up

      expected_screen =
        ":::::\n" +
        "___Q_\n" +
        "_CS__\n" +
        "___Q_\n" +
        "     "
      expect(game.screen).to eq(expected_screen)

      8.times do
        game.tick
      end

      expected_screen =
        ":::::\n" +
        "__Q__\n" +
        "__X__\n" +
        "__Q__\n" +
        "DEATH"
      expect(game.screen).to eq(expected_screen)
    end
  end
end
