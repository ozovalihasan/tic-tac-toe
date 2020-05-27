class Board
  attr_accessor :board
  def initialize
    @board = [1,2,3,4,5,6,7,8,9]
  end

  def print_board
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts '|' + '___' + '|' + '___' + '|' + '___' + '|'
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts '|' + '___' + '|' + '___' + '|' + '___' + '|'
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    puts '|' + '   ' + '|' + '   ' + '|' + '   ' + '|'
  end


  def update_board(chosen,symbol)
    @board[chosen-1] = symbol
  end
 

  def check_draw

  end

  def check_posn
    
  end
end