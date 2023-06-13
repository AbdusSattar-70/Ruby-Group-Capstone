require_relative 'item'

class Game < Item
  attr_reader :multiplayer, :last_played_at

  def initialize(publish_date, last_played_at, multiplayer)
    super(publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  private

  def can_be_archived?
    return false unless super

    last_played_years = (Time.now - @last_played_at).to_i / (365 * 24 * 60 * 60)
    last_played_years > 2
  end
end
