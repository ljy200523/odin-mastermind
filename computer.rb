class Computer
  def initialize
  end
  colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
  def get_computer_answer
    colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
    @answer = []
    4.times { @answer.push(colours.sample) }
    return @answer
  end
  def get_computer_guess(*hint)
    @first_guess = true
    colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
    @guess = []
    @next_guess = []
    puts hint
    if @first_guess
      4.times { @guess.push(colours.sample) }
      @first_guess = false
      return @guess #returns array
    else #2nd guess onwards
      hint.each_with_index do |element, index|
        if element == "White"
          next_guess[index] = guess[index]
        elsif element == "Red"
          if next_guess.any? { |element| element == nil }
            next_guess[element] = guess[index]
          end
        else
          colours.delete("#{guess[index]}")
        end
      end
    end
    next_guess.each_with_index do |element, index|
      if element == nil
        next_guess[index] = colours.sample
      end
    end
    @guess = next_guess
    next_guess = nil
  end
end
