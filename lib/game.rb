require_relative './player.rb'
require_relative './board.rb'

class Game
  attr_accessor :board, :first_player, :second_player
  attr_reader :turn_counter
  def initialize
    @board = Board.new
    @winner = false
    @turn_counter = 0
  end
  def players
    @first_player = Player.new
    @second_player = Player.new
  end

  def check_win
    if !@board.check_win.nil?
      @winner = true
    end
  end

  def turn_increase
    @turn_counter += 1
  end
end