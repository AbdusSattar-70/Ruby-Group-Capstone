require_relative './item'

class MusicAlbum < Item
  attr_accessor :name, :genre, :on_spotify, :publish_date

  def initialize(name, publish_date, genre, on_spotify: false)
    super(publish_date)
    @name = name
    @genre = genre
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super() && on_spotify
  end
end
