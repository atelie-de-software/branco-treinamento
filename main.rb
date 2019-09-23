require 'dispel'
require_relative 'src/game'

x = 0
y = 0
output = ''
game = Game.new
# draw app and redraw after each keystroke
Dispel::Screen.open do |screen|
  Dispel::Keyboard.output timeout: 0.5 do |key|
    screen.draw game.output
    next unless key

    exit(true) if key == :"Ctrl+c"
    game.update(key)
  end
end
