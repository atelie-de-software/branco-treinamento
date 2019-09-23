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

    context '#go_up' do
      subject { frog.go_up }

      it do
        subject
        expect(frog.get_coordinates).to match_array [0,1]
      end
    end

    context '#go_down' do
      subject { frog.go_down }

      it do
        subject
        expect(frog.get_coordinates).to match_array [0,-1]
      end
    end

    context '#go_left' do
      subject { frog.go_left }

      it do
        subject
        expect(frog.get_coordinates).to match_array [-1,0]
      end
    end

    context '#go_right' do
      subject { frog.go_right }

      it do
        subject
        expect(frog.get_coordinates).to match_array [1,0]
      end
    end
  end
end
