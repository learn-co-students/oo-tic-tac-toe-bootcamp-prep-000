require_relative 'cpu.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'game.rb'
require_relative 'game_rules.rb'

class OnePlayerX
  include GameRules

  def initialize
    @board = Board.new
    puts 'Player, please enter your name.'
    @player = Player.new
    @player.token = 'X'
    puts "Hello #{@player.name}, my name is HAL. If you're fine with calling me HAL, just press <return>. If you'd like to call me something else, type my new name and press <return>."
    @cpu = CPU.new
    @cpu.token = 'O'
    puts "Thanks for naming me #{@cpu.name}, #{@player.name}."
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

  def win_possible?
    win_combos = WIN_COMBINATIONS
    win_combos.each do |win_combo|
      win_combo.each do |index|
        @o_cells.each do |cell|
          if index == cell
            win_combo -= [index]
            if win_combo.length == 1
              @winning_position = win_combo[0]
              if @x_cells.none? { |i| i == @winning_position}
                return true
              end
            end
          end
        end
      end
    end
    false
  end

  def lose_possible?
    win_combos = WIN_COMBINATIONS
    win_combos.each do |win_combo|
      win_combo.each do |win_index|
        @x_cells.each do |x_cell|
          if win_index == x_cell
            win_combo -= [win_index]
            if win_combo.length == 1
              @losing_position = win_combo[0]
              if @o_cells.none? { |i| i == @losing_position}
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
    if win_possible?
      @winning_position
    elsif lose_possible?
      @losing_position
    elsif @x_cells.length == 1
      if @x_cells[0] == 4
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
    @board.status[won?.first] == 'X' ? @player : @cpu
  end
end
