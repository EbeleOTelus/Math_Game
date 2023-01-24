

class Player 

  attr_accessor :name, :lives, :score
def initialize(name)
  @name = name
  @score = 0
  @lives = 3
end

def lose_life
  @lives -= 1
end
end