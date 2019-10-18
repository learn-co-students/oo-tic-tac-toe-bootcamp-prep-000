
class TicTacToe
  # access with `TicTacToe::WIN_COMBINATIONS`
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right column
    [0,4,8],  # Diaonal 1
    [2,4,6]  # Diagonal 2
    ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  def empty?
    @board.all? { |pos| (pos.nil? || pos == " ")} 
  end
  
  def full?
    @board.none? {|this_pos| (this_pos.nil? || this_pos == " ")} 
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end  
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end  
  
  def valid_move(i)
    !position_taken?(i) && (i>0 && i<8)
    #(!position_taken?(i)) && ((i > 8) && (i < 0))
  end  
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end
