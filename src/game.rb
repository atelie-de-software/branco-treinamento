require_relative 'world'

class Game
  attr_accessor :state, :world

  def initialize
    @state = :GAME
    @world = World.new(20, 10)
  end

  def update

  end

  def output
    world.world
  end
end
