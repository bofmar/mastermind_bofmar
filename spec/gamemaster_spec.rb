# ./spec/gamemaster.rb
require "spec_helper.rb"

module MastermindBofmar
  RSpec.describe Gamemaster do

    context "#initialize" do
      it "initializes with a turn count of 0" do
        gm = Gamemaster.new
        expect(gm.turn_count).to eq 1
      end
    end

    context "#turn manipulation" do
      it "increments the trun count by one" do
        gm = Gamemaster.new
        gm.send(:incr_turn)
        expect(gm.turn_count).to eq 2
      end

      it "returns true when the game reaches the 12th turn" do
        gm = Gamemaster.new
        bool = gm.send(:out_of_turns?, 12)
        expect(bool).to eq true
      end

      it "returns false if the turn is less than 12" do
        gm = Gamemaster.new
        bool = gm.send(:out_of_turns?, 11)
        expect(bool).to eq false
      end
    end
  end
end