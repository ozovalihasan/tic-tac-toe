require_relative './player.rb'
require_relative './board.rb'

class Game
  attr_reader :turn_counter
  def initialize
    @board = Board.new
    @turn_counter = 0
  end

  def players(first_player, second_player)
    @first_player = Player.new(first_player, 'X')
    @second_player = Player.new(second_player, 'O')
  end

  def change_symbol(first_player, second_player)
    @first_player = Player.new(first_player, 'O')
    @second_player = Player.new(second_player, 'X')
  end

  def update_board(chosen)
    current_user = check_player
    @board.update_board(chosen, current_user.values[0])
  end

  def print_board
    @board.print_board
  end

  def check_valid(chosen)
    @board.check_valid(chosen)
  end

  def check_player
    if @turn_counter.even?
      player = @first_player.name
      symbol = @first_player.mark
    else
      player = @second_player.name
      symbol = @second_player.mark
    end
    current_user = { player => symbol }
    current_user
  end

  def check_win
    true unless @board.check_win.nil?
  end

  def turn_increase
    @turn_counter += 1
  end

  def player_info
    "The players are #{@first_player.name}(#{@first_player.mark}) and #{@second_player.name}" \
      "(#{@second_player.mark})"
  end

  def verify_update(chosen)
    if !(1..9).include?(chosen)
      'Please select another number between 1 and 9'
    elsif !check_valid(chosen)
      'Chosen number is used before'
    else
      update_board(chosen)
      true
    end
  end
end
