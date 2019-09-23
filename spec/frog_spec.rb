require './src/test'
require './src/frog'

RSpec.describe Test do
  describe "moviment" do
    let!(:frog) { Frog.new }

    context '#get_coordinates' do
      it do
        expect(frog.get_coordinates).to match_array [0,0]
      end
    end

  end
end
