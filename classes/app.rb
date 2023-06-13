require_relative 'list_all_book_and_label'

class App
  def initialize
    @list_all_book_and_label = BookLabelAddAndShow.new
  end

  def select_option(option)
    case option
    when '1'
      @list_all_book_and_label.list_all_books
    when '2'
      @list_all_book_and_label.list_all_labels
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
      @game.add_game
    end
  end
end
