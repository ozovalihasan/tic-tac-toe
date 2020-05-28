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
    @board[chosen - 1] = symbol
  end
 
  def check_win

    grid = [
        [@board[0], @board[1], @board[2]],
        [@board[3], @board[4], @board[5]],
        [@board[6], @board[7], @board[8]]
    ]

    if !check_rows(grid).nil?
        return check_rows(grid)
    end


    # check the columns
    if !check_columns(grid).nil?
        return check_columns(grid)
    end

    # check the diagonals
    diagonals = [
        [@board[0], @board[4], @board[8]],
        [@board[2], @board[4], @board[6]]
    ]

    if !check_diagonals(diagonals).nil?
        return check_diagonals(diagonals)
    end

    return nil
  end

  def all_equal?(row)
    row.each_cons(2).all? { |x,y| x == y }
  end

  def check_rows grid
    grid.each { |row| return row.first if all_equal?(row) } 
    return nil
  end

  def check_columns grid
    grid.transpose.each { |row| return row.first if all_equal?(row) }
    return nil
  end

  def check_diagonals(diagonals) 
    diagonals.each { |row| return row.first if all_equal?(row) } 
    return nil
  end

end