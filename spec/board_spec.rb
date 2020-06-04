require_relative '../lib/board'

describe Board do
  let(:new_board) {Board.new}
  let(:win_row) {[[1, 2, 3], ['X', 'X', 'X'], [7, 8, 9]]}
  let(:win_col) {[['X', 2, 3], ['X', 5, 6], ['X', 8, 9]]}
  describe '#print_board' do
    it 'prints the game board' do
      expect(new_board.print_board).to eql ("| 1 | 2 | 3 | \n|___|___|___| \n| 4 | 5 | 6 | \n|___|___|___| \n| 7 | 8 | 9 |\n|   |   |   |\n")
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
      expect(new_board.print_board).to eql ("| 1 | 2 | 3 | \n|___|___|___| \n| X | 5 | 6 | \n|___|___|___| \n| 7 | 8 | 9 |\n|   |   |   |\n")
    end
  end

  describe '#check_rows' do
    it 'checks each element in given row and return the symbol if all items are same.' do
      expect(new_board.check_rows(win_row)).to eql 'X'
    end
  end
end