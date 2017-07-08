class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # First row
    [1, 4, 7], # Second row
    [2, 5, 8], # Third row
    [0, 4, 8], # Top-left to Bottom-right diagonal
    [2, 4, 6] # Top-right to Bottom-left diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
     !(@board[index] ==  " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn_count
    @board.select{|i| i == "X" || i == "O"}.length
  end

  def current_player
    if turn_count % 2 == 0 then "X" else "O" end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.none?{|i| i == " " || i == nil}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won? then @board[won?[0]] end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
