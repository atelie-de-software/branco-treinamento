class Game
  def initialize
    @ticks = 0
    @frog_x = 0
    @frog_y = 4
    @rock1 = { x: 2, y: 1, dir: 1}
    @rock2 = { x: 2, y: 2, dir: -1}
    @rock3 = { x: 2, y: 3, dir: 1}
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

  def empty_matrix
    [
      [':', ':', ':', ':', ':', "\n"],
      ['=', '=', '=', '=', '=', "\n"],
      ['=', '=', '=', '=', '=', "\n"],
      ['=', '=', '=', '=', '=', "\n"],
      [' ', ' ', ' ', ' ', ' ']
    ]
  end

  def screen
    @matrix = empty_matrix
    @matrix[@rock1[:y]][@rock1[:x]] = 'O'
    @matrix[@rock2[:y]][@rock2[:x]] = 'O'
    @matrix[@rock3[:y]][@rock3[:x]] = 'O'
    
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

  def tick
    @ticks += 1

    if @ticks.modulo(10) == 0
      @rock1[:dir] = -@rock1[:dir] if @rock1[:x] + @rock1[:dir] > 4 || @rock1[:x] + @rock1[:dir] < 0
      @rock2[:dir] = -@rock2[:dir] if @rock2[:x] + @rock2[:dir] > 4 || @rock2[:x] + @rock2[:dir] < 0
      @rock3[:dir] = -@rock3[:dir] if @rock3[:x] + @rock3[:dir] > 4 || @rock3[:x] + @rock3[:dir] < 0

      @rock1[:x] += @rock1[:dir]
      @rock2[:x] += @rock2[:dir]
      @rock3[:x] += @rock3[:dir]
    end

    self
  end
end
