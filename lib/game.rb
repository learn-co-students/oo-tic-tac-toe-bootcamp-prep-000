require_relative '../config/environment.rb'

# The Game class is the actual game object that controls the flow
# of one or more game(s) of Tic Tac Toe
class Game
  attr_accessor :match

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
    display_board
    @match.turn until @match.over?
    won_or_draw
    return unless play_again?
    re_match? ? re_match : new_game
  end

  def display_board
    puts ''
    puts "Let's play!"
    sleep(1)
    puts ''
    @match.board.display
    puts ''
  end

  def won_or_draw
    puts "Congratulations, #{@match.winner.name}!" if @match.won?
    puts 'Cats Game!' if @match.draw?
  end

  def play_again?
    puts 'Play again? (y/n)'
    input = gets.strip.downcase
    return true if input == 'y'
    return false if input == 'n'
    play_again?
  end

  def re_match?
    puts ''
    puts 'Rematch? (y/n)'
    input = gets.strip.downcase
    return true if input == 'y'
    return false if input == 'n'
    re_match?
  end

  def re_match
    @match.board.reset
    @match.player_one.token_set.clear
    @match.player_two.token_set.clear
    play
  end

  def new_game
    gets_players
    play
  end
end
