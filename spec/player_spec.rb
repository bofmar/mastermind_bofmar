# ./spec/player_spec.rb
require "spec_helper.rb"

module MastermindBofmar
  RSpec.describe Player do
    
    context "#initialize" do
      it "returns name Bob if initialized without passing a name" do
        player = Player.new
        expect(player.name).to eq "Bob"
      end

      it "returns the name that was passed to it correctly" do
        player = Player.new("John Doe")
        expect(player.name).to eq "John Doe"
      end
    end
  end
end