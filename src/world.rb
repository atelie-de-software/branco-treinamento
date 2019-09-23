class World

  def get_world
    Array.new(10) do |y|
       Array.new(10) do |x|
         next ' ' if y == 0 || y == 9
         next 'O' if x == 4
         next '='
       end
    end
  end
end
