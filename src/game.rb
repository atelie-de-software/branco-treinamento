class Game
  def initialize
    @frog_x = 0
    @frog_y = 4
    @matrix
  end

  def up
    @frog_y += 1  if @frog_y < 4
    self
  end

  def down
    @frog_y -= 1 if @frog_y > 0
    self
  end

  def left
    @frog_x -= 1 if @frog_x > 0
    self
  end

  def right
    @frog_x += 1 if @frog_x < 4
    self
  end

  def empty_matrix
    [
      [':', ':', ':', ':', ':', "\n"],
      ['=', '=', 'O', '=', '=', "\n"],
      ['=', '=', 'O', '=', '=', "\n"],
      ['=', '=', 'O', '=', '=', "\n"],
      [' ', ' ', ' ', ' ', ' ']
    ]
  end

  def screen
    @matrix = empty_matrix
    @matrix[@frog_y][@frog_x] = 'M'
    @matrix.flatten.join('')
  end

  def tick

  end
end
