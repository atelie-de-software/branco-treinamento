require 'ruby2d'
require_relative 'src/game'

SPRITE_WIDTH = 62.freeze
SPRITE_HEIGHT = 62.freeze

game = Game.new

update do
  system 'clear'

  game_screen = game.screen
  puts game_screen
  coord_y = 0
  game_screen.split("\n").each do |lines|
    coord_x = 0
    lines.split('').each do |sprite|
      case sprite
      when '='
        Image.new('water.png', x: coord_x, y: coord_y)
      when ' '
        Image.new('start.png', x: coord_x, y: coord_y)
      when ':'
        Image.new('finish.png', x: coord_x, y: coord_y)
      when 'X'
        Image.new('dead.png', x: coord_x, y: coord_y)
      when 'M'
        Image.new('start.png', x: coord_x, y: coord_y)
        Image.new('frog.png', x: coord_x, y: coord_y)
      when 'O'
        Image.new('water.png', x: coord_x, y: coord_y)
        Image.new('leaf.png', x: coord_x, y: coord_y)
      when 'B'
        Image.new('water.png', x: coord_x, y: coord_y)
        Image.new('leaf.png', x: coord_x, y: coord_y)
        Image.new('frog.png', x: coord_x, y: coord_y)
      when '#'
        Image.new('finish.png', x: coord_x, y: coord_y)
        Image.new('frog.png', x: coord_x, y: coord_y)
      end

      coord_x += SPRITE_WIDTH
    end
    coord_y += SPRITE_HEIGHT
  end
  sleep 0.2
  game.tick
end

on :key_down do |event|
  game.right if event.key == 'right'
  game.left if event.key == 'left'
  game.up if event.key == 'up'
  game.down if event.key == 'down'
end

show
