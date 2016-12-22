=begin
class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #def initialize(index)
  #  @index = input.to_i - 1
  #end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, current_player)
    @board[input.to_i-1] = current_player
  end

  def position_taken?(input)
    !(@board[input].nil? || @board[input] == " ")
  end

  def valid_move?(input)
    input.between?(1,9) && !input_taken?(input-1)
  end

  def turn
     display_board
     puts "Please enter 1-9:"
     input = gets.strip
     if !valid_move?(input)
       turn
     end
     move(input, current_player)
     display_board
   end

   def draw?
     !won? && @board.all?{|current_player| current_player == "X" || current_player == "O"}
   end


  def full?
    @board.all?{|current_player| current_player == "X" || current_player == "O"}
  end

  def over?
    won? || draw?
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|current_player| current_player == "X" || current_player == "O"}
  end
  
end
=end


class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    display_board
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def over?
    won? || draw?
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def move(location, token)
    @board[location.to_i-1] = token
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      position(combo[0]) == position(combo[1]) &&
      position(combo[1]) == position(combo[2]) &&
      position_taken?(combo[0])
    end
  end

  def draw?
    !won? && @board.all?{|token| token == "X" || token == "O"}
  end

  def winner
    if winning_combo = won?
      @winner = position(winning_combo.first)
    end
  end

  def position(location)
    @board[location.to_i]
  end

  def position_taken?(location)
    !(position(location).nil? || position(location) == " ")
  end
end