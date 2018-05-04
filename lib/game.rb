class Game

attr_reader :player_1, :player_2, :current_player

    def initialize(player_1, player_2)
      @player_1 = player_1
      @player_2 = player_2
      @current_player = player_2
    end

    def attack(player)
      player.decrease_health
    end

    def switch_player
      @current_player = opponent
    end

    private

    def opponent
      @current_player == player_1 ? player_2 : player_1
    end

end
