class Game
  def initialize
    @frog_x = 0
    @frog_y = 4
    @matrix
  end

  def up
  end

  def down
  end

  def left
  end

  def right
    @frog_x += 1
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
    @matrix[@frog_y][@frog_x] = 'Q'
    @matrix.flatten.join('')
  end

  def tick

  end
end
