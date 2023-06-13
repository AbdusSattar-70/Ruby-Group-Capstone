require_relative '../classes/book'
require_relative '../classes/label'
require_relative '../classes/list_all_book_and_label'

RSpec.describe BookLabelAddAndShow do
  let(:book_label) { BookLabelAddAndShow.new }

  before do
    allow(FileUtils).to receive(:mkdir_p)
    allow(File).to receive(:write)
    allow(File).to receive(:empty?).and_return(false)
    allow(File).to receive(:read).with('data/books.json')
      .and_return('[{"id": 1, "title": "Book Title", "publisher": "Publisher",
        "publish_date": "2023-06-13", "cover_state": "GOOD"}]')
    allow(File).to receive(:read).with('data/labels.json')
      .and_return('[{"id": 1, "title": "Book Title", "color": "Red"}]')
    allow(JSON).to receive(:parse).and_return([])
  end

  describe '#add_book' do
    it 'adds a book and label to the collection' do
      allow(book_label).to receive(:gets).and_return("Book Title\n", "Red\n", "2023-06-13\n", "Publisher\n", "GOOD\n")

      expect { book_label.add_book }.to change { book_label.books.length }.by(1)
      expect { book_label.add_book }.to change { book_label.labels.length }.by(1)
    end
  end

  describe '#input_cover_state' do
    it 'returns the cover state if valid' do
      allow(book_label).to receive(:gets).and_return("GOOD\n")

      expect(book_label.input_cover_state).to eq('GOOD')
    end

    it 'prompts again for cover state if invalid' do
      allow(book_label).to receive(:gets).and_return("Invalid\n", "BAD\n")

      expect { book_label.input_cover_state }.to output(/Invalid cover state/).to_stdout
      expect(book_label.input_cover_state).to eq('BAD')
    end
  end

  describe '#store_book' do
    it 'stores the book in JSON file' do
      book = Book.new('2023-06-13', 'Publisher', 'GOOD', 'Book Title')

      expect(File).to receive(:write).with('data/books.json', /"title":"Book Title"/)
      book_label.store_book(book)
    end
  end

  describe '#store_label' do
    it 'stores the label in JSON file' do
      label = Label.new('Book Title', 'Red')

      expect(File).to receive(:write).with('data/labels.json', /"title":"Book Title"/)
      book_label.store_label(label)
    end
  end
end
