require_relative '../classes/game'
require_relative '../classes/author'
require_relative '../classes/list_all_game_and_author'

RSpec.describe GameAuthorAddAndShow do
  let(:game_author) { GameAuthorAddAndShow.new }

  describe '#add_game' do
    it 'adds a game and author to the collection' do
      game_author = GameAuthorAddAndShow.new
      allow(game_author).to receive(:gets).and_return(
        "last_played_at_value\n",
        "multiplayer_value\n",
        "2023-06-13\n",
        "first_name_value\n",
        "last_name_value\n"
      )

      expect { game_author.add_game }.to output(/Game added successfully/).to_stdout
    end
  end

  describe '#list_all_games' do
    it 'displays information for all games' do
      game_author = GameAuthorAddAndShow.new

      allow(game_author).to receive(:load_json).with('data/games.json').and_return([
     { 'id' => 1, 'last_played_at' => 'last_played_at_1', 'multiplayer' => 'multiplayer_1',
       'publish_date' => '2023-06-13' },
     { 'id' => 2, 'last_played_at' => 'last_played_at_2', 'multiplayer' => 'multiplayer_2',
        'publish_date' => '2023-06-14' }
  ])

      output = ''
      allow(game_author).to receive(:display_message) { |message| output << ("#{message}\n") }

      game_author.list_all_games

      expect(output).to include("game: last_played_at_1, multiplayer: multiplayer_1,\n         publish Date: 2023-06-13")
      expect(output).to include("game: last_played_at_2, multiplayer: multiplayer_2,\n         publish Date: 2023-06-14")
    end
  end

  describe '#list_all_authors' do
    it 'displays information for all authors' do
      # Set up the initial state with at least one author in the JSON file
      initial_authors = [{ 'id' => 1, 'first_name' => 'first_name_value', 'last_name' => 'last_name_value' }]
      File.write('data/authors.json', initial_authors.to_json)

      game_author = GameAuthorAddAndShow.new

      expect { game_author.list_all_authors }.to output(/author: first_name_value last_name_value/).to_stdout
      # Add additional expectations if needed
    end
  end
end
