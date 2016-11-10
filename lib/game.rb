require_relative '../lib/two_player.rb'
require_relative '../lib/one_player.rb'

class Game
  def initialize
    puts 'Welcome to Tic Tac Toe!'
  end

  def gets_players
    puts ''
    puts 'One or two players? (press 1 or 2 and hit <return>)'
    @players = gets.strip
    if @players == '1'
      @match = OnePlayer.new
    elsif @players == '2'
      @match = TwoPlayer.new
    else
      gets_players
    end
  end

  def play
    puts "Let's play!"
    sleep(1)
    puts ''
    @match.board.display
    @match.turn until @match.over?
    won_or_draw
    return unless play_again?
    gets_players
    play
  end

  def won_or_draw
    if @match.won?
      puts "Congratulations, #{@match.winner.name}!"
    elsif @match.draw?
      puts 'Cats Game!'
    end
  end

  def play_again?
    puts 'Play again? (y/n)'
    input = gets.strip.downcase
    if input == 'y'
      true
    elsif input == 'n'
      false
    else
      play_again?
    end
  end
end
