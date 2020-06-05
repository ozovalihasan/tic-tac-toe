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
    it 'returns true if given position number is between 1 and 9.' do
      expect(new_board.check_valid(9)).to eql true
    end

    it "returns false if given position number isn't between 1 and 9." do      
      expect(new_board.check_valid(10)).to eql false
    end
 
  end

  describe '#update_board' do
    it 'replaces the current item in given position with given symbol if given position number is between 1 and 9.' do
      new_board.update_board(4, 'X')
      expect(new_board.instance_variable_get(:@board)).to eql [1, 2, 3, 'X', 5, 6, 7, 8, 9]
    end
    it 'adding new items until given position if given position number is not between 1 and 9.' do
      new_board.update_board(11, 'X')        
      expect(new_board.instance_variable_get(:@board)).to eql [1, 2, 3, 4, 5, 6, 7, 8, 9, nil, 'X']
    end
  end

  describe '#check_rows' do
    it 'return the symbol if all items are same in any row.' do
      expect(new_board.check_rows(win_row)).to eql 'X'
    end

    it 'return nil if all items in a row are not same.' do
      expect(new_board.check_rows(win_col)).to eql nil
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
