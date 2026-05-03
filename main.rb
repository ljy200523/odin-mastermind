class Peg
  attr_accessor :colour, :type
  def initialize(colour, type)
    @colour = colour
    @type = type
  end
  colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
  colour = ["Red", "White", "None"]
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
  def get_guess(first, second, third, fourth)
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
  colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
  def get_answer
    colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
    @computer_answer = []
    4.times { @computer_answer.push(colours.sample) }
    return @computer_answer
  end
  colour = ["Red", "White", "None"]
  def hint # Compare latest guess in guesses vs @answer
    last_guess = guess.reject { |subarray| subarray.nil? || subarray.empty? }.last #last valid subarray
    if (last_guess & @answer).any? #if share any element
      for i in 0..3
        if last_guess[i] == answer[i]
          puts "White"
        else
          for j in 0..3
            if last_guess[j] == answer[i]
              puts "Red"
            end
          end
        end
      end
    else puts "None"
    end
  end
end

class Mastermind
  def initialize
  end
  peg, computer, board, player
  answer = Computer.get_answer
  board.answer.push(answer)
  12.times do |index|
    guess = player.get_guess()
    board.guesses.push(guess)
    board.print_board
    if board.check_answer
      puts "You're correct, Player wins"
      break
    elsif index < 11
      Computer.hint
      next
    else
      puts "The Computer wins"
      board.print_board
      board.print_answer
      break
    end
  end
end

guess = [[1, 2, 3, 4], [1, 3], []]
answer = [4, 3, 2, 1]

p guess.reject { |subarray| subarray.nil? || subarray.empty? }.last #prints last valid subarray
puts (guess.reject { |subarray| subarray.nil? || subarray.empty? }.last & answer).any? #prints boolean result of last valid subarray & answer
