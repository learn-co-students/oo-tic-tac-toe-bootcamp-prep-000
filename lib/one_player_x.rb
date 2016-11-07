require_relative 'cpu.rb'
require_relative 'board.rb'
require_relative 'player.rb'
require_relative 'new_game.rb'

class OnePlayerX
  def initialize
    @board = Board.new
    puts 'Player, please enter your name.'
    @player = Player.new
    puts "Hello #{@player.name}, my name is HAL. If you're fine with calling me HAL, just press <return>. If you'd like to call me something else, type my new name and press <return>."
    @cpu = CPU.new
    puts "Thanks for naming me #{@cpu.name}, #{@player.name}."
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # top left to bottom right diagonal
    [6, 4, 2] # bottom left to top right diagonal
  ]

  def move(position, token = 'X')
    index = position.to_i - 1
    @board.status[index] = token
  end

  def position_taken?(index)
    !(@board.status[index].nil? || @board.status[index] == ' ')
  end

  def valid_move?(position)
    index = position.to_i - 1
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    if player_turn?
      token = current_token
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

  def game_status
    @x_cells = []
    @o_cells = []
    @board.status.each_with_index do |cell, index|
      if cell == 'X'
        @x_cells.push(index)
      end
      if cell == 'O'
        @o_cells.push(index)
      end
    end
  end

  def best_move
    WIN_COMBINATIONS.each do |win_combination|

    end
  end

  def cpu_turn
    input = 1 + rand(9)
    if valid_move?(input)
      move(input, current_token)
      puts "#{@cpu.name}: I'll pick #{input}."
      @board.display
    else
      cpu_turn
    end
  end

  def turn_count
    occupied_cells = @board.status.select { |cell| cell == 'X' || cell == 'O' }
    occupied_cells.length
  end

  def current_token
    turn_count.even? ? 'X' : 'O'
  end

  def current_player
    turn_count.even? ? @player : @cpu
  end

  def player_turn?
  	current_player == @player ? true : false
  end

  def won?
    if WIN_COMBINATIONS.any? do |win_combination|
         win_combination.all? { |index| @board.status[index] == 'X' } ||
         win_combination.all? { |index| @board.status[index] == 'O' }
       end
      WIN_COMBINATIONS.each do |win_combination|
        if win_combination.all? { |index| @board.status[index] == 'X' } ||
           win_combination.all? { |index| @board.status[index] == 'O' }
          return win_combination
        end
      end
    else false
    end
  end

  def full?
    @board.status.all? { |i| i == 'X' || i == 'O' }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    @board.status[won?.first] == 'X' ? @player : @cpu
  end
end
