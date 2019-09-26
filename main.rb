require 'ruby2d'
require_relative 'src/game'

SPRITE_WIDTH = 62.freeze
SPRITE_HEIGHT = 62.freeze

SPRITES = {
  'D': ['assets/images/start.png'],
  'E': ['assets/images/start.png'],
  'A': ['assets/images/start.png'],
  'T': ['assets/images/start.png'],
  'H': ['assets/images/start.png'],
  'W': ['assets/images/start.png'],
  'I': ['assets/images/start.png'],
  'N': ['assets/images/start.png'],
  '=': ['assets/images/water.png'],
  ' ': ['assets/images/start.png'],
  ':': ['assets/images/finish.png'],
  '7': ['assets/images/start.png'],
  'X': ['assets/images/water.png', 'assets/images/dead.png'],
  'M': ['assets/images/start.png', 'assets/images/frog.png'],
  'O': ['assets/images/water.png', 'assets/images/leaf.png'],
  'B': ['assets/images/water.png', 'assets/images/leaf.png', 'assets/images/frog.png'],
  '#': ['assets/images/finish.png', 'assets/images/frog.png']
}

background = Music.new('assets/sounds/TheRiver.mp3')
background.loop = true
background.volume = 30
background.play

frog_jump = Sound.new('assets/sounds/FrogJump.mp3')
splash = Sound.new('assets/sounds/Splash.mp3')
barulho_agua = 0
game = Game.new

update do
  clear
  system 'clear'

  game_screen = game.screen
  puts game_screen
  game_screen.split("\n").each_with_index do |lines, index_y|
    lines.split('').each_with_index do |sprite, index_x|
      render_sprite(sprite, index_x, index_y)
    end
  end

  if game_screen.count('X').positive? && barulho_agua == 0
    splash.play
    barulho_agua += 1
  end

  sleep 0.2
  game.tick
end

on :key_down do |event|
  game.right if event.key == 'right'
  game.left if event.key == 'left'
  game.up if event.key == 'up'
  game.down if event.key == 'down'

  frog_jump.play
end

def render_sprite sprite_code, x_index, y_index
  sprite_paths = SPRITES[sprite_code.to_sym]
  x_coord = (x_index * SPRITE_WIDTH)
  y_coord = (y_index * SPRITE_HEIGHT)
  
  sprite_paths.each do |sprite_path|
    Image.new(sprite_path, x: x_coord, y: y_coord, width: SPRITE_WIDTH, height: SPRITE_HEIGHT)
  end
end

show
