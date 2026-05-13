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
    puts "Colours: Blue, Orange, Green, Purple, Pink, Brown"
    print "Guess: "
    response = gets.split
    return response #returns array
  end
  def get_player_answer()
    puts "Colours: Blue, Orange, Green, Purple, Pink, Brown"
    print "Answer: "
    response = gets.split
    return response #returns array
  end
end
