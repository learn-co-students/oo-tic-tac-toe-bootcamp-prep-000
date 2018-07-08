
class TicTacToe
 
 def initialize(board=nil)
   @board = board || Array.new(9, " ")
 end
 
 def board
   @board
 end
 
 def board=(board)
   @board = board
 end
 
 def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(i)
  return (i.to_i - 1)
end

def move(ind, arg)
  @board[ind] = arg
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  if(index < 0 || index > 9 || index == nil)
    return FALSE
  elsif(position_taken?(index))
    return FALSE
  else
    return TRUE
  end
end

def turn_count
  idx = 0
  @board.each do |index|
    if(!((index == " ") || (index == "")))
      idx += 1
    end
  end
  return idx
end

 WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]
  
end