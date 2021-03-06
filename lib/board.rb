class Board
  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def print_board
    board_string = "| #{@board[0]} | #{@board[1]} | #{@board[2]} | \n" \
    '|' + '___' + '|' + '___' + '|' + '___' + '| ' + "\n" \
    "| #{@board[3]} | #{@board[4]} | #{@board[5]} | \n" \
    '|' + '___' + '|' + '___' + '|' + '___' + '| ' + "\n" \
    "| #{@board[6]} | #{@board[7]} | #{@board[8]} |\n" \
    '|' + '   ' + '|' + '   ' + '|' + '   ' + '|' + "\n"
    board_string
  end

  def check_valid(chosen)
    @board[chosen - 1].is_a? Integer
  end

  def update_board(chosen, symbol)
    @board[chosen - 1] = symbol
  end

  def check_win
    grid = [
      [@board[0], @board[1], @board[2]],
      [@board[3], @board[4], @board[5]],
      [@board[6], @board[7], @board[8]]
    ]

    # check the rows
    return check_rows(grid) unless check_rows(grid).nil?

    # check the columns
    return check_columns(grid) unless check_columns(grid).nil?

    # check the diagonals
    return check_diagonals(grid) unless check_diagonals(grid).nil?

    nil
  end

  def check_rows(grid)
    grid.each { |row| return row.first if all_equal?(row) }
    nil
  end

  def all_equal?(row)
    row.each_cons(2).all? { |x, y| x == y }
  end

  def check_columns(grid)
    check_rows(grid.transpose)
  end

  def check_diagonals(grid)
    diagonals = [
      [grid[0][0], grid[1][1], grid[2][2]],
      [grid[2][0], grid[1][1], grid[2][0]]
    ]
    check_rows(diagonals)
  end
end
