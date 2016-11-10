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
      players_turn
    else
      cpu_turn
    end
  end

  def players_turn
    token = @player.token
    puts ''
    puts "#{@player.name}, please enter 1-9:"
    input = gets.strip
    player_move(input, token)
  end

  def player_move(input, token)
    if valid_move?(input)
      move(input, token)
      puts ''
      @board.display
      puts ''
      puts ''
    else
      players_turn
    end
  end

  def cpu_best_move
    status(@player, @cpu)
    if @cpu.win_possible?(@player)
      @cpu.winning_position
    elsif @player.win_possible?(@cpu)
      @player.winning_position
    elsif @player.token_set.length == 1
      @player.token_set[0] == 4 ? 0 : 4
    else
      rand(9)
    end
  end

  def cpu_turn
    input = cpu_best_move + 1
    cpu_move(input)
  end

  def cpu_move(input)
    if valid_move?(input)
      move(input, @cpu.token)
      puts "#{@cpu.name}: I'll pick #{input}."
      sleep(1)
      puts ''
      @board.display
      puts ''
    else
      cpu_turn
    end
  end

  def current_player
    turn_count.even? ? @player : @cpu
  end

  def players_turn?
    current_player == @player ? true : false
  end

  def winner
    @board.status[won?.first] == @player.token ? @player : @cpu
  end
end
