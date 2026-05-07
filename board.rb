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
