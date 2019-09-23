require './src/world'

RSpec.describe World do
  describe "#get_world" do
    let(:size_x) { 20 }
    let(:size_y) { 10 }
    subject { World.new(size_x, size_y).world }

    it "return a world with a fixed size of 10x10" do
      expect(subject.count).to eq size_y
      expect(subject.first.count).to eq size_x
    end

    it 'the first line is land' do
      expect(subject.first.first).to eq ' '
    end

    it 'the last line is land' do
      expect(subject.first.last).to eq ' '
    end

    it "the elements on the 4th line are rocks" do
      expect(subject[1][4]).to eq 'O'
      expect(subject[2][4]).to eq 'O'
      expect(subject[5][4]).to eq 'O'
      expect(subject[6][4]).to eq 'O'
      expect(subject[8][4]).to eq 'O'
    end

    it "the elements are water" do
      expect(subject[1][0]).to eq '='
      expect(subject[2][2]).to eq '='
      expect(subject[5][3]).to eq '='
      expect(subject[7][5]).to eq '='
      expect(subject[8][6]).to eq '='
    end
  end
end
