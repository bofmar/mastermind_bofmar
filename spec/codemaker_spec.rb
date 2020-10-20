# ./spec/codemaker.rb
require "spec_helper.rb"

module MastermindBofmar
  RSpec.describe CodeMaker do
    
    context "#initialize" do
      it "inherits the initialization method from Player" do
        cm = CodeMaker.new("HAL-9000")
        expect(cm.name).to eq "HAL-9000"
      end
    end

    context "#code creation" do
      it "creates a four digit code" do
        cm = CodeMaker.new
        cm.create_code
        expect(cm.code.length).to eq 4
      end
    end

    context "#evaluation of the player's answe" do
      it "returns victory if the player foud the correct answer" do
        cm = CodeMaker.new
        expect(cm.evaluate_answer "1234", "1234").to eq 0
      end
      it "returns the correct number of pegs when there is only one common number and in the correct place" do
        cm = CodeMaker.new
        test_hash = { "red" => 1, "white" => 0 }
        expect(cm.evaluate_answer "1234", "1567").to eq test_hash
      end
      it "returns the correct number of pegs when there is only one common number but in the wrong place" do
        cm = CodeMaker.new
        test_hash = { "red" => 0, "white" => 1 }
        expect(cm.evaluate_answer "1234", "6167").to eq test_hash
      end
      it "returns the correct number of pegs when there is a mixture of numbers in the correct place and in the incorect place" do
        cm = CodeMaker.new
        test_hash = { "red" => 1, "white" => 1 }
        expect(cm.evaluate_answer "1234", "1527").to eq test_hash
      end
      it "returns the correct number of pegs when there are duplicates" do
        cm = CodeMaker.new
        test_hash = { "red" => 1, "white" => 0 }
        expect(cm.evaluate_answer "1231", "1567").to eq test_hash
      end
    end

  end
end