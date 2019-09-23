require_relative 'world'

class Game
  def initialize
    @frog_x = 1
    @frog_y = 5
  end

  def sobe
  end

  def desce
  end

  def esquerda
  end

  def direita
  end

  def tela
    result = ''
    result = Array.new(5) do |y|
      Array.new(7) do |x|
        next ' ' if y == 0 || y == (size_y - 1)
        next 'O' if x == 4
        next '='
      end
    end
  end

  def tick
  end
end
