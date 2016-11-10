require_relative '../lib/two_player.rb'
require_relative '../lib/one_player.rb'

class Game

  def initialize
    puts 'Welcome to Tic Tac Toe!'
  end

  def get_players
    puts ''
    puts 'One or two players? (press 1 or 2 and hit <return>)'
    @players = gets.strip
    if @players == '1'
      @match = OnePlayer.new
    elsif @players == '2'
      @match = TwoPlayer.new
    else
      get_players
    end
  end

  def play
    puts "Let's play!"
    sleep(1)
    puts ''
    @match.board.display
    until @match.over?
      @match.turn
    end

    if @match.won?
      puts "Congratulations, #{@match.winner.name}!"
    elsif @match.draw?
      puts 'Cats Game!'
    end

    if play_again?
      get_players
      play
    end
  end

  def play_again?
    y = 'y'
    n = 'n'
    puts 'Play again? (y/n)'
    input = gets.strip.downcase
    if input == y
      true
    else
      input == n ? false : play_again?
    end
  end
end