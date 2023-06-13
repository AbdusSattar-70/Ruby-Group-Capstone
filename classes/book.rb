require_relative 'item'

class Book < Item
  attr_reader :publisher, :cover_state, :title

  def initialize(publish_date, publisher, cover_state, title)
    super(publish_date)
    @publisher = publisher
    @cover_state = cover_state
    @title = title
  end

  private

  def can_be_archived?
    super || cover_state == 'bad'
  end
end
