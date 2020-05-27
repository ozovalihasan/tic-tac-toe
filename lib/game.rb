require_relative './player.rb'
require_relative './board.rb'

class Game
  attr_accessor :turn_counter,:board
  def initialize(name__symbol)
    @first_player = Player.new(name__symbol[:first_player], name__symbol[:first_symbol])
    @second_player = Player.new(name__symbol[:second_player], name__symbol[:second_symbol])
    @winner = false
    @win = false
    @draw = false
    @turn_counter = 0
    @board = Board.new
    # play
  end


  

  def play
    while !@win or !@draw
      turn_number = 0
      winner = nil
      # while true 
      #   if turn_number%2 ==0 
      #     player = 1
      #   else 
      #     player = 2
      #   end

      #   puts "#{player}. player turn"
      #   print_board
      #   puts 'Choose the number to play'
      #   choose_number = gets.chomp

      #   # Number is checked 
      #   # If it is suitable, the number will be shown as selected on board 
      #   # If not, it will be asked to choose another number
      #   turn_number += 1



      #   # If turn number is greater than 5, it wil be checked whether there is any winner or not
      #   unless winner == nil and turn_number < 9
        
      #     puts "winner #{winner}" if winner 
      #     puts 'It is and of game because there is no number to play' unless turn_number < 9
      #     puts 'Do you want to play one more time?'
      #     one_more = gets.chomp
      #     if 'y' == one_more[0].downcase
      #       # reset board,winner and turn number
      #     elsif 'n' == one_more[0].downcase
      #       break
      #     end
      # end
      # end
      # check_win
      # check_draw
    end
  end

  def check_win

  end


end