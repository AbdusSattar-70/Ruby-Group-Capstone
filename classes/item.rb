require 'date'

class Item
  attr_reader :id, :genre, :author, :label
  attr_accessor :publish_date

  def initialize(publish_date)
    @id = Random.rand(1..1000)
    @publish_date = publish_date
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless genre.add_item.include?(self)
  end

  def author=(author)
    @author = author
    author.add_item(self) unless author.add_item.include?(self)
  end

  def label=(label)
    @label = label
    label.add_item(self) unless label.add_item.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?

  end
end
