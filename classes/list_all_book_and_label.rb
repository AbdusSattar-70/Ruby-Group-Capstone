require_relative 'book'
require_relative 'label'
require 'json'
require 'date'
require 'fileutils'

class BookLabelAddAndShow
  attr_accessor :books, :labels

  def initialize
    @books = []
    @labels = []
  end

  def add_book
    display_message('Enter the title of the book: ')
    title = gets.chomp
    display_message('Enter the color of the book cover: ')
    color = gets.chomp
    display_message('Enter the publish date of the book (YYYY-MM-DD): ')
    publish_date = gets.chomp
    display_message('Enter the publisher of the book: ')
    publisher = gets.chomp

    cover_state = input_cover_state

    book = Book.new(publish_date, publisher, cover_state, title)
    label = Label.new(title, color)
    @books.push(book)
    @labels.push(label)
    display_message('Book added successfully.')
    store_book(book)
    store_label(label)
  end

  def input_cover_state
    loop do
      display_message('Enter the cover state of the book (GOOD or BAD): ')
      cover_state = gets.chomp.upcase
      return cover_state if %w[GOOD BAD].include?(cover_state)

      display_message('Invalid cover state. Please enter either GOOD or BAD.')
    end
  end

  def store_book(book)
    hash = {
      id: book.id,
      title: book.title,
      publisher: book.publisher,
      publish_date: book.publish_date,
      cover_state: book.cover_state
    }

    stored_book = load_json('data/books.json')
    stored_book << hash
    write_json('data/books.json', stored_book)
  end

  def store_label(label)
    hash = {
      id: label.id,
      title: label.title,
      color: label.color
    }

    stored_label = load_json('data/labels.json')
    stored_label << hash
    write_json('data/labels.json', stored_label)
  end

  def load_json(file_path)
    File.empty?(file_path) ? [] : JSON.parse(File.read(file_path))
  rescue Errno::ENOENT
    []
  end

  def write_json(file_path, data)
    FileUtils.mkdir_p('data')
    File.write(file_path, data.to_json)
  end

  def list_all_books
    @books = load_json('data/books.json')
    @books.each do |book|
      display_message("Book Title: #{book['title']}, Publisher: #{book['publisher']},
        Publish Date: #{book['publish_date']}, Cover State: #{book['cover_state']}")
    end
  end

  def list_all_labels
    @labels = load_json('data/labels.json')
    @labels.each do |label|
      display_message("Label: #{label['title']}, Color: #{label['color']}")
    end
  end

  private

  def display_message(message)
    puts '-------------------------------------------'
    puts message
    puts '-------------------------------------------'
  end
end
