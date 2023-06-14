require_relative 'game'
require_relative 'author'
require 'json'
require 'date'
require 'fileutils'
require 'pry'

class GameAuthorAddAndShow
  attr_accessor :games, :authors

  def initialize
    @games = []
    @authors = []
  end

  def add_game
    display_message('Enter the last_played_at of the game: ')
    last_played_at = gets.chomp
    display_message('Enter the multiplayer of the game: ')
    multiplyer = gets.chomp
    display_message('Enter the publish date of the game (YYYY-MM-DD): ')
    publish_date = gets.chomp
    display_message('Enter the first name of the author: ')
    first_name = gets.chomp
    display_message('Enter the last name of the author: ')
    last_name = gets.chomp

    game = Game.new(publish_date, last_played_at, multiplyer)
    author = Author.new(first_name, last_name)
    @games.push(game)
    @authors.push(author)
    display_message('Game added successfully.')
    store_game(game)
    store_author(author)
  end

  def store_game(game)
    hash = {
      id: game.id,
      last_played_at: game.last_played_at,
      multiplayer: game.multiplayer,
      publish_date: game.publish_date
    }

    stored_game = load_json('data/games.json')
    stored_game << hash
    write_json('data/games.json', stored_game)
  end

  def store_author(author)
    hash = {
      id: author.id,
      first_name: author.first_name,
      last_name: author.last_name
    }

    stored_author = load_json('data/authors.json')
    stored_author << hash
    write_json('data/authors.json', stored_author)
  end

  def load_json(file_path)
    if File.exist?(file_path)
      json_data = File.read(file_path)
      json_data.empty? ? [] : JSON.parse(json_data)
    else
      []
    end
  rescue Errno::ENOENT => e
    raise "Error loading JSON file: #{e.message}"
  end

  def write_json(file_path, data)
    FileUtils.mkdir_p('data')
    File.write(file_path, data.to_json)
  end

  def list_all_games
    @games = load_json('data/games.json')
    @games.each do |game|
      display_message("game: #{game[:last_played_at]}, multiplayer: #{game[:multiplayer]},
         publish Date: #{game[:publish_date]}")
    end
  end

  def list_all_authors
    @authors = load_json('data/authors.json')
    @authors.each do |author|
      display_message("author: #{author[:first_name]}, #{author[:last_name]}")
    end
  end

  private

  def display_message(message)
    puts '-------------------------------------------'
    puts message
    puts '-------------------------------------------'
  end
end
