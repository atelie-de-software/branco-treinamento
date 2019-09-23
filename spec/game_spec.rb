require './src/game'

RSpec.describe Game do
  describe "sobe" do
    let(:game) { Game.new }

    it '' do
      tela_inicial =
        "     \n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        "Q    "
      expect(game.tela).to eq(tela_inicial)
      game.direita

      tela_esperada =
        "     \n" +
        "==O==\n" +
        "==O==\n" +
        "==O==\n" +
        " Q   "
      expect(game.tela).to eq(tela_esperada)
    end

  end
end
