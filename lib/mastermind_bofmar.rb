require "mastermind_bofmar/version"
require_relative "./mastermind_bofmar/player.rb"
require_relative "./mastermind_bofmar/gamemaster.rb"
require_relative "./mastermind_bofmar/codemaker.rb"
require_relative "./mastermind_bofmar/codebraker.rb"
require_relative "./mastermind_bofmar/human.rb"


module MastermindBofmar
  gm = Gamemaster.new
  gm.choose_mode
end