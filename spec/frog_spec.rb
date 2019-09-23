require './src/test'
# require './src/frog'

RSpec.describe Test do
  describe "moviment" do
    let!(:field) do
      [
        ['=','=','='],
        ['=','Q','='],
        ['=','=','=']
      ]
    end

    context "to stay untouch" do
      let!(:untouch) { [ ['=','=','='], ['=','Q','='], ['=','=','='] ] }

      it do
        expect(field[0]).to match_array untouch[0]
        expect(field[1]).to match_array untouch[1]
        expect(field[2]).to match_array untouch[2]
      end
    end

    context "to go up" do
      let!(:to_up) { [ ['=','Q','='], ['=','=','='], ['=','=','='] ] }

      it do
        expect(field[0]).to match_array to_up[0]
        expect(field[1]).to match_array to_up[1]
        expect(field[2]).to match_array to_up[2]
      end
    end
  end
end
