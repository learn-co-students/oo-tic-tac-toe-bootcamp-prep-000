
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

def turn
  puts "Please enter 1-9?"
  input = gets.strip
  i = input_to_index(input)
  puts "Moving to index - #{i}"
  if(valid_move?(i))
    display_board(move(i, current_player))
  else
    turn
  end
end

def current_player
  if(turn_count % 2 == 0)
    return "X"
  else
    return "O"
  end
end

def won?
    WIN_COMBINATIONS.each do |win_combo|
      if(@board[win_combo[0]].upcase == "X" && @board[win_combo[1]].upcase == "X" && @board[win_combo[2]].upcase == "X" )
      return win_combo
      elsif (@board[win_combo[0]].upcase == "O" && @board[win_combo[1]].upcase == "O" && @board[win_combo[2]].upcase == "O" )
        return win_combo
      end
    end
  return false
end

def full?
  return (!((@board.include?(" ")) || (@board.include?(""))))
end

def draw?
  return (full? && (!(won?)))
end

def over?
  return (won? || full? || draw?)  
end

def winner
  if(won?)
    return (@board[won?[0]])
  else
    return nil
  end
end

def play 
  until over?
    turn
  end
  if(won?)
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
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