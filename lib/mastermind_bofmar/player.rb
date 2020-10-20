# /lib/mastermind_bofmar/player.rb

module MastermindBofmar
  class Player
    attr_reader :name
    
    def initialize(name = "Bob")
      @name = name
    end

    def lament name
      puts "HAL-9000 says: Just what do you think you're doing, #{name}? #{name}, I really think I'm entitled to an answer to that question."
    end
    
    def gloat
      puts "HAL-9000 says: This mission is too important for me to allow you to jeopardize it."
    end

  end
end