class Computer
  def initialize
    @first_guess = true
    @guess = []
    @next_guess = []
    @colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
  end
  def get_computer_answer
    colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
    @answer = []
    4.times { @answer.push(colours.sample) }
    return @answer
  end
  def get_computer_guess(*hint)
    next_guess = Array.new(4, nil)
    hint = hint.flatten
    p "hint argument: #{hint}"
    if @first_guess
      4.times { @guess.push(@colours.sample) }
      @first_guess = false
      return @guess #returns array
    else #2nd guess onwards
      hint.each_with_index do |element, index|
        if element == "White"
          next_guess[index] = @guess[index]
        end
      end
      nil_positions = next_guess.each_index.select { |index| next_guess[index] == nil }
      hint.each_with_index do |element, index|
        if element == "Red"
          if next_guess[index].nil?
            next_guess[nil_positions.sample] = @guess[index]
          end
        elsif element == "None"
          @colours.delete("#{@guess[index]}")
        end
      end
    end
    next_guess.each_with_index do |element, index|
      if element == nil
        next_guess[index] = @colours.sample
      end
    end
    @guess = next_guess
    return @guess
  end
end
