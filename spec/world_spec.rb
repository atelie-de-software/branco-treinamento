require './src/world'

RSpec.describe World do
  describe "#get_world" do
    subject { World.new.get_world }

    it "return a world with a fixed size of 10x10" do
      expect(subject.count).to eq 10
      expect(subject.first.count).to eq 10
    end

    xit 'the first line is land' do
      expect(subject.first).to eq [ ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
    end

    xit 'the last line is land' do
      expect(subject.first).to eq [ ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
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
