# /lib/mastermind_bofmar/player.rb

module MastermindBofmar
  class Player
    attr_reader :name
    
    def initialize(name = "Bob")
      @name = name
    end
    
  end
end