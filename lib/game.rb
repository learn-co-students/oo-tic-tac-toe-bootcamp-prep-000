require_relative '../lib/two_player.rb'
require_relative '../lib/one_player.rb'

# The Game class is the actual game object that controls the flow
# of one or more game(s) of Tic Tac Toe
class Game
  def initialize
    puts 'Welcome to Tic Tac Toe!'
  end

  def gets_players
    puts ''
    puts 'One or two players? (press 1 or 2 and hit <return>)'
    @players = gets.strip
    @match = if @players == '1'
               OnePlayer.new
             elsif @players == '2'
               TwoPlayer.new
             end
    return unless @match.nil?
    gets_players
  end

  def play
    puts "Let's play!"
    sleep(1)
    puts ''
    @match.board.display
    puts ''
    @match.turn until @match.over?(@match.board)
    won_or_draw
    return unless play_again?
    gets_players
    play
  end

  def won_or_draw
    if @match.won?(@match.board)
      puts "Congratulations, #{@match.winner.name}!"
    elsif @match.draw?(@match.board)
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
