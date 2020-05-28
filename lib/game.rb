require_relative './player.rb'
require_relative './board.rb'

class Game
  attr_accessor :turn_counter,:board, :win
  def initialize(name__symbol)
    @first_player = Player.new(name__symbol[:first_player], name__symbol[:first_symbol])
    @second_player = Player.new(name__symbol[:second_player], name__symbol[:second_symbol])
    @winner = false
    @win = false
    @draw = false
    @turn_counter = 0
    @board = Board.new
  end
 
  # Add more methods in here for further abstraction
  def check_win
    symbol = @board.check_win
    if !symbol.nil?
      @win = true
      @winner = true
    end



    # call to determine and update the winner
    
  end
end