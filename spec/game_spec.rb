# rubocop:disable Metrics/LineLength

require_relative '../lib/game'

describe Game do
  let(:new_game) { Game.new }
  describe '#players' do
    it 'creates two instances from Player class and assigns them input symbol.' do
      new_game.players('Hasan', 'Thapa')
      expect(new_game.instance_variable_get(:@first_player).name).to eql 'Hasan'
      expect(new_game.instance_variable_get(:@first_player).mark).to eql 'X'
      expect(new_game.instance_variable_get(:@second_player).name).to eql 'Thapa'
      expect(new_game.instance_variable_get(:@second_player).mark).to eql 'O'
    end
  end

  describe '#change_symbol' do
    it 'creates two instances from Players class and assigns them the changed input symbol.' do
      new_game.change_symbol('Hasan', 'Thapa')
      expect(new_game.instance_variable_get(:@first_player).name).to eql 'Hasan'
      expect(new_game.instance_variable_get(:@first_player).mark).to eql 'O'
      expect(new_game.instance_variable_get(:@second_player).name).to eql 'Thapa'
      expect(new_game.instance_variable_get(:@second_player).mark).to eql 'X'
    end
  end

  describe '#update_board' do
    it 'updates given positon of board' do
      new_game.players('Hasan', 'Thapa')
      new_game.update_board(3)
      expect(new_game.instance_variable_get(:@board).instance_variable_get(:@board)).to eql([1, 2, 'X', 4, 5, 6, 7, 8, 9])
    end
  end

  describe '#print_board' do
    it 'prints the current state of board' do
      expect(new_game.print_board).to eql "| 1 | 2 | 3 | \n|___|___|___| \n| 4 | 5 | 6 | \n|___|___|___| \n| 7 | 8 | 9 |\n|   |   |   |\n"
    end
  end

  describe '#check_valid' do
    it 'returns true if the value of board in given position is an integer.' do
      expect(new_game.check_valid(9)).to eql true
    end

    it 'returns false if the value of board in given position is not an integer' do
      new_game.players('Hasan', 'Thapa')
      new_game.update_board(4)
      expect(new_game.check_valid(4)).to eql false
    end
  end

  describe '#check_player' do
    it 'returns first player name and symbol if turn number is even' do
      new_game.players('Hasan', 'Thapa')
      expect(new_game.check_player).to eql({ 'Hasan' => 'X' })
    end

    it 'returns second player name and symbol if turn number is odd' do
      new_game.players('Hasan', 'Thapa')
      new_game.turn_increase
      expect(new_game.check_player).to eql({ 'Thapa' => 'O' })
    end
  end

  describe '#check_win' do
    it 'returns true if any winning condition is satisfied ' do
      new_game.players('Hasan', 'Thapa')
      new_game.update_board(2)
      new_game.update_board(5)
      new_game.update_board(8)
      expect(new_game.check_win).to eql true
    end

    it 'returns nil if any winning condition is not satisfied.' do
      new_game.players('Hasan', 'Thapa')
      expect(new_game.check_win).to eql nil
    end
  end

  describe '#turn_increase' do
    it 'returns turn number increased by 1' do
      new_game.players('Hasan', 'Thapa')
      new_game.turn_increase
      expect(new_game.turn_increase).to eql 2
    end
  end

  describe '#player_info' do
    it 'returns players name and their symbols' do
      new_game.players('Hasan', 'Thapa')
      expect(new_game.player_info).to eql 'The players are Hasan(X) and Thapa(O)'
    end
  end

  describe '#verify_update' do
    context 'if given number is not between 1 and 9' do
      it 'returns a string saying that select another number between 1 and 9 ' do
        new_game.players('Hasan', 'Thapa')
        expect(new_game.verify_update(10)). to eql('Please select another number between 1 and 9')
      end
    end
    context 'if given number is between 1 and 9' do
      it 'returns a string warning about given number is used before if given number used before ' do
        new_game.players('Hasan', 'Thapa')
        new_game.verify_update(3)
        expect(new_game.verify_update(3)). to eql('Chosen number is used before')
      end

      it "returns true and updates board if given number doesn't cause any problem" do
        new_game.players('Hasan', 'Thapa')
        expect(new_game.verify_update(3)). to eql true
        expect(new_game.instance_variable_get(:@board).instance_variable_get(:@board)).to eql([1, 2, 'X', 4, 5, 6, 7, 8, 9])
      end
    end
  end
end
# rubocop:enable Metrics/LineLength
