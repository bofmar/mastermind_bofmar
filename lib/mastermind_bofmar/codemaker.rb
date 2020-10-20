# ./lib/mastermind_bofmar/codemaker.rb

module MastermindBofmar
  class CodeMaker < Player

    def create_code
      @code = ""
      4.times do
        @code += rand(1..6).to_s
      end

      # for testing
      # puts @code
    end

    def code
      return @code
    end

    def evaluate_answer answer, secret = @code
      if answer == secret
        return 0
      end

      code_arr = secret.split("")
      answer_arr = answer.split("")

      responce_hash = { "red" => 0, "white" => 0}

      for i in 0...code_arr.length
        if answer_arr.include? code_arr[i]
          if answer_arr[i] == code_arr[i]
            answer_arr[i] = 0 #change the checked element to prevent duplicate results
            responce_hash["red"] += 1
          else
            answer_arr[answer_arr.index(code_arr[i])] = 0 #change the checked element to prevent duplicates
            responce_hash["white"] +=1
          end
        end
      end
      return responce_hash
    end

  end
end