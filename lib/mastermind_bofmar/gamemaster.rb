# ./lib/mastermind_bofmar/gamemaster.rb

module MastermindBofmar
  class Gamemaster
    attr_accessor :turn_count
    attr_accessor :game_mode
    attr_accessor :p1
    attr_accessor :p2

    def initialize
      @turn_count = 0
    end

    def init_codebraker_mode
      # sets up the codebreaker mode, aka the mode where the pc tries to solve the player's code
    end

    def init_codemaker_mode
      # sets up the codebreaker mode, aka the mode where the player tries to solve the pc's code
      # this will be implemented later
    end

    private

    def incr_turn
      @turn_count += 1
    end

    def out_of_turns? turns
      return (turns >= 12)? true : false;
    end
  end
end