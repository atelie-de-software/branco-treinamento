require './src/game'

RSpec.describe Game do
  describe "#initialize" do
    let(:size_x) { 20 }
    let(:size_y) { 10 }
    subject { Game.new }

    it "starts a world" do
      expect(subject.world).to_not be_nil
    end

    it "starts the state in game" do
      expect(subject.state).to eq :GAME
    end
  end
end
