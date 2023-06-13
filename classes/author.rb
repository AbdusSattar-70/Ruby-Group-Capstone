require_relative 'item'

class Author < Item
  attr_reader :id, :first_name, :last_name, :books

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @books = []
  end

  def add_book(book)
    @books << book
    book.author = self
  end
end
