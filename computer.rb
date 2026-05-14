class Computer
  def initialize
    @first_guess = true
    @guess = []
    @next_guess = {"Blue": 0, "Orange": 0, "Green": 0, "Purple": 0, "Pink": 0, "Brown": 0}
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
    # p "hint argument: #{hint}"
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
      # Collect Red colors and identify colors to delete
      red_pegs = []
      colors_in_guess = @guess.uniq
      colors_in_guess.each do |color|
        indices = @guess.each_index.select { |index| @guess[index] == color }
        color_hints = indices.map { |index| hint[index] }
        if color_hints.all? { |element| element == "None"}
          @colours.delete(color)
        else
          indices.each do |i|
            red_pegs << @guess[i] if hint[i] == "Red"
          end
        end
      end
      #Fill Reds into remaining nil spots
      nil_positions = next_guess.each_index.select { |index| next_guess[index].nil? }.shuffle
      red_pegs.each do |color|
        pos = nil_positions.pop
        next_guess[pos] = color if pos
      end
      #Fill remaining nil spots with random samples
      next_guess.each_with_index do |element, index|
        if element.nil?
          next_guess[index] = @colours.sample
        end
      end
    end
    @guess = next_guess
    return @guess
  end
end
