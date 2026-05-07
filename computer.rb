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
  colour = ["Red", "White", "None"]
  def hint(player_guess) # Compare current_player_guess vs @answer
    local_answer = @answer.dup
    p "local_answer #{local_answer}"
    player_guess.each_with_index do |element, index|
      if player_guess[index] == local_answer[index]
        puts "#{index}"
        puts "White"
        local_answer[index] = nil
        p "local_answer #{local_answer}"
      elsif local_answer.include?(player_guess[index])
        puts "#{index}"
        puts "Red"
        local_answer[index] = nil
        p "local_answer #{local_answer}"
      else
        puts "#{index}"
        puts "None"
        p "local_answer #{local_answer}"
      end
    end
  end
  def get_computer_guess()
    colours = ["Blue", "Orange", "Green", "Purple", "Pink", "Brown"]
    @answer = []
    4.times { @answer.push(colours.sample) }
    return @answer #returns array
  end
end
