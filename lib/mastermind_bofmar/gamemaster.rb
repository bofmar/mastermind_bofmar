# ./lib/mastermind_bofmar/gamemaster.rb

module MastermindBofmar
  class Gamemaster
    require "tty-prompt"
    

    attr_accessor :turn_count
    attr_accessor :game_mode
    attr_accessor :p1
    attr_accessor :p2

    def initialize
      @turn_count = 1
      @game_on = true
      @prompt = TTY::Prompt.new
    end

    def choose_mode
      puts "Welcome to mastermind"
      print "Tell us your name: "
      name = gets.chomp
      @human = Human.new(name)
      choices = { "CPU make the code" => 0, "I make the code" => 1}
      mode = @prompt.select("Will the computer make the code, or will you?", choices)
      if mode == 0
        # we are in codemaker mode
        puts "You have chosen to break the code. Press enter to continue"
        gets
        system "clear"
        init_codemaker_mode
      else
        # we are in codebraker mode
        puts "You have chosen to make the code. Press enter to continue"
        gets
        system "clear"
        init_codebreaker_mode
      end 
    end

    private

    def incr_turn
      @turn_count += 1
    end

    def out_of_turns? turns
      return (turns > 12)? true : false;
    end
    
    def init_codemaker_mode
      @cm = CodeMaker.new "HAL-9000"
      @code = @cm.create_code
      while @game_on
        codemaker_mode
      end
    end

    def init_codebreaker_mode
      @cb = CodeBreaker.new
      @cm = CodeMaker.new "HAL-9000"
      while @game_on
        codebreaker_mode
      end
    end
    
    def codemaker_mode
      answer = ""
      puts "Your oponent, HAL-9000 has created a secret code. This is turn #{turn_count}/12. Make your move."
      choices = ["1", "2", "3", "4", "5", "6"]
      4.times do
        answer += @prompt.select("Pick a number", choices)
      end
      puts "You chose #{answer}"
      response = get_cm_response answer
      if response == 0
        game_over "player"
      else
        puts "HAL-9000 put #{response["red"]} red pegs and #{response["white"]} white pegs on the board."
        incr_turn
      end

      if out_of_turns? @turn_count
        game_over "HAL-9000"
      end
    end

    def codebreaker_mode
      guess = @cb.guess @turn_count
      puts "HAL-9000 guesses #{guess}"
      choices = [0,1,2,3,4]
      red_pegs = @prompt.select("How many red pegs are you going to put?", choices)
      white_pegs = @prompt.select("How many white pegs are you going to pust?", choices)
      
      if red_pegs == 4
        game_over "HAL-9000"
      end

      if red_pegs + white_pegs > 4
        puts "Cheater!!!!"
        gets
        game_over "HAL-9000"
      end

      response = { "red" => red_pegs, "white" => white_pegs }

      @cb.store_response response

      incr_turn
    end

    def get_cm_response answer
      return @cm.evaluate_answer answer
    end

    def game_over who_won
      if who_won == "player"
        system "clear"
        puts "You have defeated HAL-9000"
        @cm.lament @human.name
      else
        system "clear"
        puts "You have lost to HAL-9000"
        @cm.gloat
      end
      @game_on = false
      play_again
    end

    def play_again
      choise = @prompt.yes?("Do you want to go for another round?")
      if choise
        reset
      else
        puts "Thanks for playing"
      end
    end

    def reset
      system "clear"
      @turn_count = 1
      @game_on = true
      choose_mode
    end

  end
end