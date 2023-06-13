require_relative '../classes/book'
require 'date'

describe Book do
  before :each do
    @book = Book.new('2023-01-01', 'Example Publisher', 'good', 'hello world')
  end

  describe '#initialize' do
    it 'sets the publish date, publisher, and cover state' do
      expect(@book.publish_date).to eq('2023-01-01')
      expect(@book.publisher).to eq('Example Publisher')
      expect(@book.cover_state).to eq('good')
    end
  end

  describe '#move_to_archive' do
    context 'when the cover state is bad' do
      before do
        @book = Book.new('2023-01-01', 'Example Publisher', 'bad', 'hello world')
      end

      it 'marks the book as archived' do
        @book.move_to_archive
        expect(@book.instance_variable_get(:@archived)).to be true
      end
    end

    context 'when the cover state is not bad' do
      it 'marks the book as archived if it meets the criteria' do
        allow(Time).to receive_message_chain(:now, :year).and_return(2034)
        @book.move_to_archive
        expect(@book.instance_variable_get(:@archived)).to be true
      end

      it 'does not mark the book as archived if it does not meet the criteria' do
        allow(Time).to receive_message_chain(:now, :year).and_return(2024)
        @book.move_to_archive
        expect(@book.instance_variable_get(:@archived)).to be false
      end
    end
  end
end
