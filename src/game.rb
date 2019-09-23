require_relative 'world'

class Game
  attr_accessor :state, :world

  def initialize
    @state = :GAME
    @world = World.new(20, 10)
  end

  def update(key)
    frog.right if key == :right
    frog.left if key == :left
    frog.up if key == :up
    frog.down if key == :down
  end

  def output
    world.world
  end
end
