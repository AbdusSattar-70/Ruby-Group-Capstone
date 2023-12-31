class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name, id: Random.rand(1..1000))
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    return if item.genre == self

    @items << item
    item.genre = self
  end
end
