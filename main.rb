class Peg
  attr_accessor :colour, :type
  def initialize(colour, type)
    @colour = colour
    @type = type
  end
  colours = Blue, Orange, Green, Purple, Pink, Brown
  colour = Red, White, None
end

class Board
  attr_accessor :guesses, :answer
  def initialize
    @guesses = Array.new(12) { Array.new(4) }
    @answer = Array.new(4)
  end
  def check_correct
    for array in @guesses
      array == @answer ? true : false
    end
  end
  def print_board
    p @guesses
  end
end

class Player
  def initialize
  end
  def guess(first, second, third, fourth)
    for guess in @guesses
      if guess.empty?
        guess.push(first, second, third, fourth)
        break
      end
    end
  end
end

class Computer
  def initialize
  end
  colours = Blue, Orange, Green, Purple, Pink, Brown
  def get_answer
    colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
    @computer_answer = []
    4.times { @computer_answer.push(colours.sample) }
    return @computer_answer
  end
  colour = Red, White, None
  def hint # Compare latest guess in guesses vs @answer
    if (guess.uniq.last & @answer).any? #if share any element
      for i in 0..3
        if guess[i] == answer[i]
          puts "White"
        else puts "Red"
        end
      end
    else puts "None"
    end
  end


