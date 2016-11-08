require_relative '../lib/two_player.rb'
require_relative '../lib/one_player_x.rb'

class Game
  attr_reader :game

  def initialize
    puts 'Welcome to Tic Tac Toe!'
  end

  def get_players
    puts 'One or two players? (press 1 or 2 and hit <return>)'
    @players = gets.strip
    if @players == '1'
      @game = OnePlayerX.new
    elsif @players == '2'
      @game = TwoPlayer.new
    else
      get_players
    end
  end

  def play
    puts "Let's play!"
    @game.board.display
    until @game.over?
      @game.turn
    end

    if @game.won?
      puts "Congratulations, #{@game.winner.name}!"
    elsif @game.draw?
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