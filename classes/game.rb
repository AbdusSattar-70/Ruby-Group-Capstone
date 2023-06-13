

class Game
    attr_reader :multiplayer, :last_played_at
  
    def initialize(last_played_at, multiplayer)
      @last_played_at = last_played_at
      self.multiplayer = multiplayer
    end
  
    def multiplayer=(multiplayer)
      @multiplayer = multiplayer
      multiplayer.add_game(self) unless multiplayer.games.include?(self)
    end

    private
    def can_be_archived?
        return false unless super
        last_played_years = (Time.now - @last_played_at).to_i / (365 * 24 * 60 * 60)
        last_played_years > 2
    end

end