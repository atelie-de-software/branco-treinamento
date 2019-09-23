class World
  def get_world
    Array.new(10) do |y|
       Array.new(10) do |i|
         i == 4 ? 'O' : '='
       end
    end
  end
end
