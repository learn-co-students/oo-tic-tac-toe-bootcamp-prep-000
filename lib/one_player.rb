require_relative 'cpu.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game_rules.rb'

class OnePlayer
  include GameRules

  def initialize
    @board = Board.new
    puts ''
    puts 'Player, please enter your name.'
    @player = Player.new
    puts ''
    @player.get_token
    puts ''
    puts "Hello #{@player.name}, my name is HAL. If you're fine with calling me HAL, just press <return>. If you'd like to call me something else, type my new name and press <return>."
    @cpu = CPU.new
    set_cpu_token
    puts ''
    puts "Thanks for naming me #{@cpu.name}, #{@player.name}."
  end

  def set_cpu_token
    @player.token == 'X' ? @cpu.token = 'O' : @cpu.token = 'X'
  end

  def turn
    if players_turn?
      token = @player.token
      puts "#{@player.name}, please enter 1-9:"
      input = gets.strip
      if valid_move?(input)
        move(input, token)
        @board.display
      else
        turn
      end
    else
      cpu_turn
    end
  end

  def cpu_win_possible?
    win_combos = WIN_COMBINATIONS
    win_combos.each do |win_combo|
      win_combo.each do |win_index|
        @cpu.token_set.each do |cpu_token|
          if win_index == cpu_token
            win_combo -= [win_index]
            if win_combo.length == 1
              @cpu.winning_position = win_combo[0]
              if @player.token_set.none? { |i| i == @cpu.winning_position}
                return true
              end
            end
          end
        end
      end
    end
    false
  end

  def player_win_possible?
    win_combos = WIN_COMBINATIONS
    win_combos.each do |win_combo|
      win_combo.each do |win_index|
        @player.token_set.each do |player_token|
          if win_index == player_token
            win_combo -= [win_index]
            if win_combo.length == 1
              @player.winning_position = win_combo[0]
              if @cpu.token_set.none? { |i| i == @player.winning_position}
                return true
              end
            end
          end
        end
      end
    end
    false
  end


  def best_move
    status
    if cpu_win_possible?
      @cpu.winning_position
    elsif player_win_possible?
      @player.winning_position
    elsif @player.token_set.length == 1
      if @player.token_set[0] == 4
        0
      else
        4
      end
    else
      rand(9)
    end
  end

  def cpu_turn
    input = best_move + 1
    if valid_move?(input)
        move(input, @cpu.token)
        puts "#{@cpu.name}: I'll pick #{input}."
        @board.display
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
