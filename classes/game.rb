

class Game
    attr_reader :multiplayer, :last_played_at
    

    def multiplayer=(multiplayer)
        @multiplayer = multiplayer
        multiplayer.add_game(self) unless multiplayer.add_game.include?(self)
    end

    def last_played_at=(last_played_at)
        @last_played_at = last_played_at
        last_played_at.add_game(self) unless last_played_at.add_game.include?(self)
    end

    private
    def can_be_archived?
        return false unless super
        last_played_years = (Time.now - @last_played_at).to_i / (365 * 24 * 60 * 60)
        last_played_years > 2
    end

end