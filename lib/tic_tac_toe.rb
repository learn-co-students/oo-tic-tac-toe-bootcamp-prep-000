class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Diagonal 1 (negative slope)
    [2,4,6]  # Diagonal 2 (positive slope)
  ]
  
  def initialize
    @board = Array.new(9, " ")
    # It looks like I cannot define WIN_COMBINATIONS as an instance variable here.
  end
  
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
  
  def move(index, player = "X")
    @board[index] = player
  end
  
  def position_taken? (index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end
  
end