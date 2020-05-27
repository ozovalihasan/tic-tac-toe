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

  def check_win
    @board.check_win
  end
end