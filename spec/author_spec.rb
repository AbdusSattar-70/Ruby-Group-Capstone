require_relative '../classes/author'
require_relative '../classes/item'
require 'rspec'

RSpec.describe Author do
  let(:author) { Author.new('Igbo', 'David') }
  let(:item) { Item.new(Date.today) }

  describe '#add_item' do
    it 'adds an item to the author' do
      expect {
        author.add_item(item)
      }.to change { author.items.count }.by(1)

      expect(author.items).to include(item)
      expect(item.author).to eq(author)
    end
  end
end