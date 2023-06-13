require_relative './music_album'

class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(@id, @name, @items)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre << self
  end
end
