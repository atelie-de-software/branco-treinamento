require './src/fall'

RSpec.describe Fall do
  describe ".fell?" do
    subject{ Fall.fell?(map, x, y) }

    context 'when frog fell on water' do
      let!(:map) {[[' ',' ',' '],
                  ['=','O','='],
                  ['=','O','='],
                  ['=','O','='],
                  [' ',' ',' ']]}
      let!(:x) {1}
      let!(:y) {0}
      it 'returns true' do
        expect(subject).to be_truthy
      end
    end
  end
end
