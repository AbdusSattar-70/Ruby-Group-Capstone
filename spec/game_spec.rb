require_relative '../classes/game'
require_relative '../classes/item'
require 'date'

describe Game do
  let(:publish_date) { '2018-01-01' }
  let(:last_played_at) { Time.new(2021, 1, 1) }
  let(:multiplayer) { true }

  subject(:game) { Game.new(publish_date, last_played_at, multiplayer) }

  describe '#initialize' do
    it 'assigns the publish date, last played at, and multiplayer properties' do
      expect(game.publish_date).to eq(publish_date)
      expect(game.last_played_at).to eq(last_played_at)
      expect(game.multiplayer).to eq(multiplayer)
    end
  end

  describe '#can_be_archived?' do
    context 'when the game was last played more than 2 years ago' do
      let(:last_played_at) { Time.now - (3 * 365 * 24 * 60 * 60) }

      it 'returns true' do
        expect(game.send(:can_be_archived?)).to be true
      end
    end

    context 'when the game was last played within the last 2 years' do
      let(:last_played_at) { Time.now - (1 * 365 * 24 * 60 * 60) }

      it 'returns false' do
        expect(game.send(:can_be_archived?)).to be false
      end
    end
  end
end
