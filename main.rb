require 'ruby2d'
require_relative 'src/game'

game = Game.new


update do
  system "clear"

  game_screen = game.screen
  puts game_screen
  y = 0
  game_screen.split("\n").each do |lines|
    x = 0
    lines.split('').each do |sprite|
      Image.new('water.png', x: x, y: y) if sprite == '='
      Image.new('leaf.png', x: x, y: y) if sprite == 'O'
      Image.new('frog.png', x: x, y: y) if sprite == 'M'
      Image.new('start.png', x: x, y: y) if sprite == ' '
      Image.new('finish.png', x: x, y: y) if sprite == ':'
      Image.new('dead.png', x: x, y: y) if sprite == 'X'
      x += 62
    end
    y += 62
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
