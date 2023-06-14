require_relative 'list_all_book_and_label'
require_relative 'list_all_game_and_author'

class App
  def initialize
    @list_all_book_and_label = BookLabelAddAndShow.new
    @list_all_game_and_author = GameAuthorAddAndShow.new
  end

  def select_option(option)
    case option
    when '1'
      @list_all_book_and_label.list_all_books
    when '2'
      @list_all_book_and_label.list_all_labels
    when '3'
      @list_all_game_and_author.list_all_games
    when '4'
      @list_all_game_and_author.list_all_authors
    when '5'
      @list_all_book_and_label.list_all_music_albums
    when '6'
      @list_all_game_and_author.list_all_authors
    end
    add_items(option)
  end

  def add_items(option)
    case option
    when '7'
      @list_all_book_and_label.add_book
    when '8'
      @music.add_music_album
    when '9'
      @list_all_game_and_author.add_game
    end
  end
end
