class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [1,4,7],
    [0,3,6],
    [2,5,8]
    ]
  def initialize
    @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ',]
  
end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  puts "-----------"
end

def input_to_index(input)
  return input = input.to_i - 1
end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] ==  " " 
      return false
    else 
      return true
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
    return true
    end
  end

def turn_count
  counter = 0
  @board.each do |board_pos|
    if board_pos == "X" || board_pos == "O"
      counter += 1
    end
  end
  return counter
end 

end
