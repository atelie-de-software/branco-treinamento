require './src/game'

RSpec.describe Game do

  describe 'initial screen' do
    let(:game) { Game.new }

    it do
      expected_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        "M    "
      expect(game.screen).to eq(expected_screen)
    end
  end

  describe 'first correct move' do
    let(:game) { Game.new }

    it do
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

  describe 'move to a rock' do
    let(:game) { Game.new }

    it do
      game.right
      game.right
      game.up

      expected_screen =
        ":::::\n" +
        "==O==\n" +
        "==O==\n" +
        "==B==\n" +
        "     "
      expect(game.screen).to eq(expected_screen)
    end
  end

  describe 'fall into water' do
    let(:game) { Game.new }

    context 'from beginning of the game' do
      it 'moving up' do
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
    end

    context 'when frog on rock' do
      before(:each) do
        game.right
        game.right
        game.up
        game.up
      end

      it 'die moving left' do
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

  describe 'win the game' do
    let(:game) { Game.new }

    it do
      game.right
      game.right
      game.up
      game.up
      game.up
      game.up

      expected_screen =
        "::W::\n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        " WIN "
      expect(game.screen).to eq(expected_screen)
    end
  end

  describe 'rock movement' do
    let(:game) { Game.new }

    context 'after 10 ticks' do
      it 'the rocks should move' do
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
      it 'the rocks should have on the borders' do
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
      it 'the rocks should move back' do
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

  describe 'frog is on the rock' do
    let(:game) { Game.new }

    it 'moves with a rock' do
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

  describe 'second level' do
    let(:game) { Game.new }

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
