require_relative '../classes/game'
require_relative '../classes/author'
require_relative '../classes/list_all_game_and_author'

RSpec.describe GameAuthorAddAndShow do
  let(:game_author) { GameAuthorAddAndShow.new }

  describe '#add_game' do
    it 'adds a game and author to the lists' do
      allow(game_author).to receive(:gets).and_return(
        '2023-06-14', '2', '2023-06-14', 'Igbo', 'David'
      )
      game_author.add_game

      expect(game_author.games.length).to eq(1)
      expect(game_author.games[0].last_played_at).to eq('2023-06-14')
      expect(game_author.games[0].multiplayer).to eq('2')

      expect(game_author.authors.length).to eq(1)
      expect(game_author.authors[0].first_name).to eq('Igbo')
      expect(game_author.authors[0].last_name).to eq('David')
    end
  end

  describe '#list_all_games' do
    it 'displays information about all games' do
      game_author.add_game

      expect do
        game_author.list_all_games
      end.to output(/game: \d{4}-\d{2}-\d{2}, multiplayer: \d, publish Date: \d{4}-\d{2}-\d{2}/).to_stdout
    end
  end

  describe '#list_all_authors' do
    it 'displays information about all authors' do
      game_author.add_game

      expect { game_author.list_all_authors }.to output(/author: .+/).to_stdout
    end
  end
end
