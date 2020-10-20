# MastermindBofmar

Mastermind game that you can play in the console. Made as part of the Odin Project curriculum. Created with ruby.

## Game Description

Mastermind or Master Mind is a code-breaking game for two players. The modern game with pegs was invented in 1970 by Mordecai Meirowitz, an Israeli postmaster and telecommunications expert.[1][2] It resembles an earlier pencil and paper game called Bulls and Cows that may date back a century or more. 

## Rules

You and the computer will take the roles of the code-maker and the code-breaker. The code-maker will create a secret 4 digit code that will use number from 1 to 6. The code-breaker will then need to guess the secret code within 12 turns, otherwise the code-maker wins. After each guess the code-maker must inform the code-breaker how close he is to breaking the code by putting down a number of pegs. Red pegs represent a number that exists in the code and is in the correct place. White pegs represent a number that exists in the code but is in the wrong place


## Installation

Clone the repo to your machine and navigate to the root folder of the application. Then run the following command:

    bin/console


## Demo

## Gems Used

* [tty-prompt](https://github.com/piotrmurach/tty-prompt) : Provides a great way for getting inputs from the player.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).