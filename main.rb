class Peg
  def initialize(colour, type)
    @colour = colour
    @type = type
  end
  colours = Blue, Orange, Green, Purple, Pink, Brown
  colour = Red, White, None
end

class Board
  def initialize
    @guesses = Array.new(12) { Array.new(4) }
    @answer = Array.new(4)
  end
  def check_correct
    for array in @guesses
      array == @answer ? true : false
    end
  end
end

class Player
  def initialize
  end
  def guess(first, second, third, fourth)
    for array in arrays 
      if array.empty?
        array.push(first, second, third, fourth)
        break
      end
    end
  end
end

class Computer
  def initialize
  end
  colours = Blue, Orange, Green, Purple, Pink, Brown
  def select
    colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
    @select_space = []
    4.times { @select_space.push(colours.sample) }
    return @select_space
  end
  def hint
    for array in @guesses

# Compare latest guess in guesses vs @answer


