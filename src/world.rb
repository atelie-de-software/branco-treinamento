class World
  attr_accessor :world
  def initialize(size_x, size_y)
    @world = Array.new(size_y) do |y|
       Array.new(size_x) do |x|
         next ' ' if y == 0 || y == (size_y - 1)
         next 'O' if x == 4
         next '='
       end
    end
  end
end
