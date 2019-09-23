class Frog
  def initialize
    @x = 0
    @y = 0
  end

  def get_coordinates
    [@x, @y]
  end

  def go_up
    @y += 1
  end

  def go_down
    @y -= 1
  end

  def go_left
    @x -= 1
  end

  def go_right
    @x += 1
  end
end
