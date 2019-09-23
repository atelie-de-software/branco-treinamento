class Fall
  def self.fell?(map, x, y)
    return true if map[x][y] == '='
    false
  end
end
