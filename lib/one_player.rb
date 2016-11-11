require_relative 'cpu.rb'
require_relative 'board.rb'
require_relative 'human.rb'
require_relative 'game_rules.rb'

# The OnePlayer class is the set of specific rules and scripts
# governing a one player human v. cpu game
class OnePlayer
  include GameRules

  def initialize
    @board = Board.new
    player_init
    cpu_init
    sleep(1)
    puts "New match:
#{@player.name}(#{@player.token})
vs.
#{@cpu.name}(#{@cpu.token})!"
    puts ''
  end

  def cpu_init
    puts "Hello #{@player.name}, my name is HAL.
If you're fine with calling me HAL, just press <return>.
If you'd like to call me something else,
type my new name and press <return>."
    @cpu = CPU.new
    @cpu.sets_token(@player)
    puts ''
    puts "Thanks for naming me #{@cpu.name}, #{@player.name}."
    puts ''
  end

  def player_init
    puts ''
    puts 'Player, please enter your name.'
    @player = Human.new
    puts ''
    @player.sets_token(@cpu)
  end

  def turn
    if current_player == @player
      @player.turn(@board)
    else
      @cpu.turn(@board, @player)
    end
  end

  def current_player
    turn_count(@board).even? ? @player : @cpu
  end

  def winner
    winning_token(@board) == @player.token ? @player : @cpu
  end
end
