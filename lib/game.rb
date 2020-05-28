require_relative './player.rb'
require_relative './board.rb'

class Game
  attr_accessor :board, :first_player, :second_player
  attr_reader :turn_counter, :winner, :current_user
  def initialize
    @board = Board.new
    @winner = false
    @turn_counter = 0
  end

  def players
    @first_player = Player.new('name', 'X')
    @second_player = Player.new('name', 'O')
  end

  def change_symbol
    @first_player = Player.new('name', 'O')
    @second_player = Player.new('name', 'X')
  end

  def check_player
    if game.turn_counter.even?
      player = game.first_player.name
      symbol = game.first_player.mark
    else
      player = game.second_player.name
      symbol = game.second_player.mark
    end
    :current_user = {player => symbol} 
  end

  def check_win
    @winner = true unless @board.check_win.nil?
  end

  def turn_increase
    @turn_counter += 1
  end
end
