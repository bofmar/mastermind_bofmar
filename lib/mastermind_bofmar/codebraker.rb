# ./lib/mastemind_bofmar/codebraker.rb

module MastermindBofmar
  class CodeBreaker < Player
    def initialize
      @possible_codes = create_codes
      @cm = CodeMaker.new
    end

    def create_codes
      codes = []
      for i in 1111..6666
        codes << i.to_s
      end
      remove_invalid codes
      return codes
    end

    def guess turn
      if turn == 1
        @prev_guess = "1122"
        return "1122"
      end

      trim_list

      i = rand(0...@possible_codes.length)
      @prev_guess = @possible_codes[i]
      return @possible_codes[i]
    end

    def trim_list
      @possible_codes.select! { |el| @cm.evaluate_answer(el, @prev_guess) == @prev_response }
      p @possible_codes.length
    end

    def store_response response
      @prev_response = response
    end

    def remove_invalid codes
      codes.select! { |el| !el.to_s.include?("0") }
      codes.select! { |el| !el.to_s.include?("7") }
      codes.select! { |el| !el.to_s.include?("8") }
      codes.select! { |el| !el.to_s.include?("9") }
    end
  end
end