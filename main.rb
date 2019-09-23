require 'dispel'
require_relative 'src/game'

game = Game.new
# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  Dispel::Keyboard.output timeout: 0.5 do |key|
    screen.draw game.screen

    next unless key

    exit(true) if key == :"Ctrl+c"

    game.right if key == :right
    game.left if key == :left
    game.up if key == :up
    game.down if key == :down
  end
end
