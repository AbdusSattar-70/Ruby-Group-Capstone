require_relative 'book'

class Author
  attr_reader :id, :first_name, :last_name, :books

  def initialize(_first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = name
    @last_name = last_name
    @books = []
  end

  def add_book(book)
    @books << book
    book.author = self
  end
end

# author = Author.new("David", "Igbo")
# book = Book.new("Unlimited Resources")

# author.add_book(book)
