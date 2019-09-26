class Game
  DEFAULT_TICK_SPEED = 10.freeze

  def initialize
    @ticks = 0
    @frog_x = 0
    @frog_y = 4
    @dead = false
    @rocks = [
      { x: 2, y: 1, dir: 1},
      { x: 2, y: 2, dir: -1},
      { x: 2, y: 3, dir: 1}
    ]
    @cars = [
      { x: 3, y: 1, dir: -1},
      { x: 1, y: 2, dir: 1},
      { x: 3, y: 3, dir: -1}
    ]
    @level = 1
    @passou = false
    @ticks_depois_que_passou = 0
    @ticks_after_death = 0
  end

  def move(dx: 0, dy: 0)
    @frog_y = [[0, @frog_y + dy].max, 4].min
    @frog_x = [[0, @frog_x + dx].max, 4].min
    self
  end

  def up()    move(dy: -1) end
  def down()  move(dy:  1) end
  def left()  move(dx: -1) end
  def right() move(dx:  1) end

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
      ['_', '_', '_', '_', '_', "\n"],
      ['_', '_', '_', '_', '_', "\n"],
      ['_', '_', '_', '_', '_', "\n"],
      [' ', ' ', ' ', ' ', ' ']
    ]
  end

  def screen
    @matrix = @level == 1 ? empty_matrix_first_map : empty_matrix_second_map
    game_engine
    @level == 1 ? tile_overwrite1 : tile_overwrite2

    @matrix.flatten.join('')
  end

  def game_engine
    @rocks.each do |rock|
      @matrix[rock[:y]][rock[:x]] = 'O'
    end if @level == 1

    @cars.each do |car|
      @matrix[car[:y]][car[:x]] = car[:dir] == 1 ? 'C' : 'Q'
    end if @level > 1
  end

  def tile_overwrite1
    case @matrix[@frog_y][@frog_x]
    when '='
      @matrix[@frog_y][@frog_x] = 'X'
      @matrix[4] = ['D', 'E', 'A', 'T', 'H']
    when ':'
      @matrix[@frog_y][@frog_x] = '#'
      @matrix[4] = [' ', 'W', 'I', 'N', ' ']
    when 'O'
      @matrix[@frog_y][@frog_x] = 'B'
    else
      @matrix[@frog_y][@frog_x] = 'M'
    end
  end

  def tile_overwrite2
    case @matrix[@frog_y][@frog_x]
    when '_'
      @matrix[@frog_y][@frog_x] = 'S'
    when ':'
      @matrix[@frog_y][@frog_x] = '#'
      @matrix[4] = [' ', 'W', 'I', 'N', ' ']
    when 'C'
      @matrix[@frog_y][@frog_x] = '>'
      @matrix[4] = ['D', 'E', 'A', 'T', 'H']
    when 'Q'
      @matrix[@frog_y][@frog_x] = '<'
      @matrix[4] = ['D', 'E', 'A', 'T', 'H']
    else
      @matrix[@frog_y][@frog_x] = '7'
    end
  end

  def tick
    @ticks += 1
    @ticks_depois_que_passou += 1 if @passou
    @ticks_after_death += 1 if @dead

    @passou = true if @frog_y == 0

    if @ticks_depois_que_passou == 4
      @ticks_depois_que_passou = 0
      @passou = false

      @level += 1
      @frog_x = 2
      @frog_y = 4
    end

    if @level == 1
      if @ticks.modulo(DEFAULT_TICK_SPEED).zero?
        @rocks.each do |rock|
          rock[:dir] = -rock[:dir] if rock[:x] + rock[:dir] > 4 || rock[:x] + rock[:dir] < 0

          @frog_x += rock[:dir] if rock[:x] == @frog_x && rock[:y] == @frog_y
          rock[:x] += rock[:dir]
        end
      end

      @dead = is_dead_on_level1
    else
      if @ticks.modulo(8).zero?
        @cars.each do |car|
          car[:x] += car[:dir]
          car[:x] = 4 if car[:x] == -1
          car[:x] = 0 if car[:x] == 5
        end
      end
    end

    if @dead && @level == 1 && @ticks_after_death == 9
      @ticks_after_death = 0
      @dead = false
      @frog_x = 0
      @frog_y = 4
    end

    self
  end

  private

  def is_dead_on_level1
    result = false
    @rocks.each do |rock|
      result = true if (rock[:x] != @frog_x && rock[:y] != @frog_y) && (@frog_y > 0 && @frog_y < 4)
      break
    end

    result
  end
end
