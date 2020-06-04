require_relative '../lib/game'
require_relative '../lib/player.rb'

describe Game do
  let(:new_game) {Game.new}
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
end