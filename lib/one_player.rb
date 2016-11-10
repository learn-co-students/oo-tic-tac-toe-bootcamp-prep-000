require_relative 'cpu.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game_rules.rb'

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
    @player = Player.new
    puts ''
    @player.sets_token(@cpu)
  end

  def turn
    if players_turn?
      @player.turn(@board)
    else
      @cpu.turn(@board, @player)
    end
  end

  def current_player
    turn_count(@board).even? ? @player : @cpu
  end

  def players_turn?
    current_player == @player ? true : false
  end

  def winner
    @board.status[won?(@board).first] == @player.token ? @player : @cpu
  end
end
