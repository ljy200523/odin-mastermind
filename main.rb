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
    @guesses = Array.new(12) { Array.new } #To initialize an empty array
    @answer = Array.new(4)
  end
  def check_correct
    last_guess = @guesses.reject { |subarray| subarray.nil? || subarray.empty? }.last #last valid subarray
    if last_guess == @answer
      return true
    else
      return false
    end
  end
  def print_board
    p @guesses
  end
  def insert_guess(new_guess)
    # first, second, third, fourth = new_guess.split(" ")
    for guess in @guesses
      if guess.empty?
        guess.replace(new_guess)
        puts "Guess: #{guess}"
        break
      end
    end
  end
  def insert_answer(computer_answer)
    @answer = computer_answer
    puts "Computer Answer: #{@answer}"
  end
end

class Player
  def initialize
  end
  def get_guess()
    puts "Colours: Blue, Orange, Green, Purple, Pink, Brown"
    print "Guess: "
    response = gets.split
    return response #returns array
  end
end

class Computer
  def initialize
  end
  colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
  def get_answer
    colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
    @answer = []
    4.times { @answer.push(colours.sample) }
    return @answer
  end
  colour = ["Red", "White", "None"]
  def hint(player_guess) # Compare current_player_guess vs @answer
    if (player_guess & @answer).any? #if share any element
      for i in 0..3
        if player_guess[i] == @answer[i]
          puts "White"
        else
          for j in 0..3
            if player_guess[j] == @answer[i]
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
    @board = Board.new
    @computer = Computer.new
    @player = Player.new
  end
  # peg, computer, board, player
  def play
    @board.insert_answer(@computer.get_answer)
    12.times do |index|
      current_guess = @player.get_guess
      @board.insert_guess(current_guess)
      @board.print_board
      if @board.check_correct
        puts "You're correct, Player wins"
        break
      elsif index < 11
        @computer.hint(current_guess)
        next
      else
        puts "The Computer wins"
        @board.print_board
        @board.print_answer
        break
      end
    end
  end
end

game = Mastermind.new
game.play
