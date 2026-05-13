require_relative "board"
require_relative "player"
require_relative "computer"
require_relative "peg"

class Mastermind
  def initialize
    @board = Board.new
    @computer = Computer.new
    @player = Player.new
  end
  def get_hint(guess, answer)
    local_answer = answer.dup
    hint_list = Array.new(4, nil)
    p "local_answer #{local_answer}"
    guess.each_with_index do |element, index|
      if guess[index] == local_answer[index]
        # puts "#{index}"
        hint_list[index] = "White"
        local_answer[index] = nil
        p "local_answer #{local_answer}"
      end
    end
    guess.each_with_index do |element, index|
      if hint_list[index].nil?
        if local_answer.include?(guess[index])
          # puts "#{index}"
          hint_list[index] = "Red"
          red_position = local_answer.index(guess[index])
          local_answer[red_position] = nil
          p "local_answer #{local_answer}"
        elsif hint_list[index] == nil #to prevent Overwritting "White" with "None" & include "None" when local_answer == nil
          # puts "#{index}"
          hint_list[index] = "None"
          p "local_answer #{local_answer}"
        end
      end
    end
    p hint_list
    return hint_list
  end
  def play 
    game_mode = @player.get_game_mode
    if game_mode.downcase.strip.start_with?("g") #PLAYER IS GUESSING
      answer = @computer.get_computer_answer
      @board.insert_answer(answer)
      12.times do |index|
        current_guess = @player.get_player_guess
        @board.insert_guess(current_guess)
        @board.print_board
        if @board.check_correct
          puts "You're correct, Player wins"
          break
        elsif index < 11
          get_hint(current_guess, answer)
          next
        else
          puts "The Computer wins"
          @board.print_board
          @board.print_answer
          break
        end
      end
    elsif game_mode.downcase.strip.start_with?("c") #PLAYER IS CREATING
      answer = @player.get_player_answer
      @board.insert_answer(answer)
      hint = nil
      12.times do |index|
        current_guess = @computer.get_computer_guess(hint)
        @board.insert_guess(current_guess)
        @board.print_board
        if @board.check_correct
          puts "Computer is correct, Computer wins"
          break
        elsif index < 11
          hint = get_hint(current_guess, answer)
          next
        else
          puts "The Player wins"
          @board.print_board
          @board.print_answer
          break
        end
      end
    end
  end
end

game = Mastermind.new
game.play
