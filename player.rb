class Player
  def initialize
  end
  def get_game_mode()
    loop do
      puts "Choose the game mode: Creator or Guesser"
      print "Game Mode: "
      response = gets.chomp
      if response.downcase.strip.start_with?("g") #PLAYER IS GUESSING
        return true
      elsif response.downcase.strip.start_with?("c") #PLAYER IS CREATING
        return false
      end
    end
  end
  def get_player_guess()
    loop do
      puts "Colours: Blue, Orange, Green, Purple, Pink, Brown"
      print "Guess: "
      response = gets.split
      response.each_with_index do |element, index|
        case
        when element.downcase.start_with?('b') && element.downcase.end_with?('e')
          response[index] = "Blue"
        when element.downcase.start_with?('o')
          response[index] = "Orange"
        when element.downcase.start_with?('g')
          response[index] = "Green"
        when element.downcase.start_with?('p') && element.downcase.end_with?('e')
          response[index] = "Purple"
        when element.downcase.start_with?('p') && element.downcase.end_with?('k')
          response[index] = "Pink"
        when element.downcase.start_with?('b') && element.downcase.end_with?('n')
          response[index] = "Brown"
        else
          response[index] = nil
        end
      end
      if response.any? { |element| element == nil}
        puts "Invalid Guess"
      else
        return response #returns array
      end
    end
  end
  def get_player_answer()
    puts "Colours: Blue, Orange, Green, Purple, Pink, Brown"
    print "Answer: "
    response = gets.split
    return response #returns array
  end
end
