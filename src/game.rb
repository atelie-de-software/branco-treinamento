class Game
  def initialize
    @level = 1
    @ticks = 0
    @frog_x = 0
    @frog_y = 4
    @rock1 = { x: 2, y: 1, dir: 1}
    @rock2 = { x: 2, y: 2, dir: -1}
    @rock3 = { x: 2, y: 3, dir: 1}
    @rocks = [
      { x: 2, y: 1, dir: 1},
      { x: 2, y: 2, dir: -1},
      { x: 2, y: 3, dir: 1}
    ]
    @matrix

  end

  def up
    @frog_y -= 1 if @frog_y > 0
    self
  end

  def down
    @frog_y += 1  if @frog_y < 4
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

  def empty_matrix_first_map
    [
      [':', ':', ':', ':', ':', "\n"],
      ['=', '=', '=', '=', '=', "\n"],
      ['=', '=', '=', '=', '=', "\n"],
      ['=', '=', '=', '=', '=', "\n"],
      [' ', ' ', ' ', ' ', ' ']
    ]
  end

  def empty_matrix_second_map
    [
      [':', ':', ':', ':', ':', "\n"],
      ['_', '_', '_', 'Q', '_', "\n"],
      ['_', 'C', '_', '_', '_', "\n"],
      ['_', '_', '_', 'Q', '_', "\n"],
      [' ', ' ', ' ', ' ', ' ']
    ]
  end

  def screen
    @matrix = @level == 1 ? empty_matrix_first_map : empty_matrix_second_map

    if @level == 1
      game_engine_first_map
    end

    if @matrix[@frog_y][@frog_x] == '='
      @matrix[@frog_y][@frog_x] = 'X'
      @matrix[4] = ['D', 'E', 'A', 'T', 'H']
    elsif @matrix[@frog_y][@frog_x] == ':'
      @matrix[@frog_y][@frog_x] = 'M'
      @matrix[4] = [' ', 'W', 'I', 'N', ' ']
    else
      @matrix[@frog_y][@frog_x] = 'M'
    end
    @matrix.flatten.join('')
  end

  def game_engine_first_map
    @rocks.each do |rock|
      @matrix[rock[:y]][rock[:x]] = 'O'
    end
  end

  def tick
    @ticks += 1

    if @ticks.modulo(10) == 0
      @rocks.each do |rock|
        rock[:dir] = -rock[:dir] if rock[:x] + rock[:dir] > 4 || rock[:x] + rock[:dir] < 0

        @frog_x += rock[:dir] if rock[:x] == @frog_x && rock[:y] == @frog_y
        rock[:x] += rock[:dir]
      end
    end

    self
  end
end
