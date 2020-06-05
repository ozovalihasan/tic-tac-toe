# rubocop:disable Metrics/LineLength

require_relative '../lib/board'

describe Board do
  let(:new_board) { Board.new }
  let(:win_row) { [[1, 2, 3], %w[X X X], [7, 8, 9]] }
  let(:win_col) { [['X', 2, 3], ['X', 5, 6], ['X', 8, 9]] }
  let(:win_diag) { [['X', 2, 3], [4, 'X', 6], [7, 8, 'X']] }
  let(:win_equal) { %w[X X X] }
  let(:not_equal) { [1, 2, 'X'] }
  describe '#print_board' do
    it 'prints the game board' do
      expect(new_board.print_board).to eql "| 1 | 2 | 3 | \n|___|___|___| \n| 4 | 5 | 6 | \n|___|___|___| \n| 7 | 8 | 9 |\n|   |   |   |\n"
    end
  end

  describe '#check_valid' do
    it 'returns true if the value of board in given position is an integer.' do
      expect(new_board.check_valid(9)).to eql true
    end
    it 'returns false if the value of board in given position is not an integer' do
      new_board.update_board(4, 'X')
      expect(new_board.check_valid(4)).to eql false
    end
  end

  describe '#update_board' do
    it 'replaces the current item in given position with given symbol.' do
      new_board.update_board(4, 'X')
      expect(new_board.instance_variable_get(:@board)).to eql [1, 2, 3, 'X', 5, 6, 7, 8, 9]
    end
  end

  describe '#check_rows' do
    it 'return the symbol if all items are same in any row.' do
      expect(new_board.check_rows(win_row)).to eql 'X'
    end

    it 'return nil if all items in any row are not same.' do
      expect(new_board.check_rows(win_col)).to eql nil
    end
  end

  describe '#check_columns' do
    it 'return the symbol if all items are same in any column.' do
      expect(new_board.check_columns(win_col)).to eql 'X'
    end

    it 'return nil if all items in any column are not same.' do
      expect(new_board.check_columns(win_row)).to eql nil
    end
  end

  describe '#check_diagonals' do
    it 'return the symbol if all items are same in any diagonal.' do
      expect(new_board.check_diagonals(win_diag)).to eql 'X'
    end

    it 'return nil if all items in any diagonal are not same.' do
      expect(new_board.check_diagonals(win_col)).to eql nil
    end
  end

  describe '#all_equal?' do
    it 'returns true if all elements of given array are equal.' do
      expect(new_board.all_equal?(win_equal)).to eql true
    end
    it 'returns false if all elements ofgiven array are not equal.' do
      expect(new_board.all_equal?(not_equal)).to eql false
    end
  end

  describe '#check_win' do
    it 'returns nil if any winning condition is not satisfied.' do
      expect(new_board.check_win).to eql nil
    end
    it 'returns the symbol  of winner if any winning condition is satisfied ' do
      new_board.update_board(2, 'X')
      new_board.update_board(5, 'X')
      new_board.update_board(8, 'X')
      expect(new_board.check_win).to eql('X')
    end
  end
end
# rubocop:enable Metrics/LineLength
