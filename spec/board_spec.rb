# rubocop:disable Metrics/LineLength

require_relative '../lib/board'

describe Board do
  let(:new_board) { Board.new }
  let(:win_row) { [[1, 2, 3], %w[X X X], [7, 8, 9]] }
  let(:win_col) { [['X', 2, 3], ['X', 5, 6], ['X', 8, 9]] }
  let(:win_diag) { [['X', 2, 3], [4, 'X', 6], [7, 8, 'X']] }
  let(:win_equal) { %w[X X X] }
  describe '#print_board' do
    it 'prints the game board' do
      expect(new_board.print_board).to eql "| 1 | 2 | 3 | \n|___|___|___| \n| 4 | 5 | 6 | \n|___|___|___| \n| 7 | 8 | 9 |\n|   |   |   |\n"
    end
  end

  describe '#check_valid' do
    it 'checks the value of board in given position to be integer.' do
      expect(new_board.check_valid(3)).to eql true
    end
  end

  describe '#update_board' do
    it 'replaces the current item in given position with given symbol.' do
      new_board.update_board(4, 'X')
      expect(new_board.print_board).to eql "| 1 | 2 | 3 | \n|___|___|___| \n| X | 5 | 6 | \n|___|___|___| \n| 7 | 8 | 9 |\n|   |   |   |\n"
    end
  end

  describe '#check_rows' do
    it 'checks each element in given row and return the symbol if all items are same.' do
      expect(new_board.check_rows(win_row)).to eql 'X'
    end
  end

  describe '#check_columns' do
    it 'checks each element in given column and return the symbol if all items are same.' do
      expect(new_board.check_columns(win_col)).to eql 'X'
    end
  end

  describe '#check_diagonals' do
    it 'checks each element in given diagonals and return the symbol if all items are same.' do
      expect(new_board.check_diagonals(win_diag)).to eql 'X'
    end
  end

  describe '#all_equal?' do
    it 'checks whether all elements of given array are same ' do
      expect(new_board.all_equal?(win_equal)).to eql true
    end
  end

  describe '#check_win' do
    it 'checks whether all elements of given array are same ' do
      new_board.update_board(2, 'X')
      new_board.update_board(5, 'X')
      new_board.update_board(8, 'X')
      expect(new_board.check_win).to eql('X')
    end
  end
end
# rubocop:enable Metrics/LineLength
