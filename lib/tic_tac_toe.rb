class TicTacToe
 def initialize
   @board=Array.new(9, " ")
 end

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

def display_board
     puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" +  " #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" +  " #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" +  " #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index,character)
  @board[index]=character
end

def position_taken?(index)
 !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.to_i
  if index.between?(0,8)
    if position_taken?(index)
      false
    else
      true
    end
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  input=gets.strip
  index=input_to_index(input)
  if valid_move?(index)
    character=current_player
    move(index,character)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0
  @board.each do |position_value|
    if ((position_value == "X") || (position_value == "O"))
      counter += 1
    end
  end
  return counter
end

def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
  end
end

def full?
@board.each do |pos|
 if (pos.nil?) || (pos == " ")
   return false
 end
end
return true
end

def draw?
 if full? && !won?
   return true
 else
   return false
 end
end

def over?
 if draw? || won? || full?
   return true
 else
   return false
 end
end

def won?
 WIN_COMBINATIONS.each do |win_combination|
   win_index_1 = win_combination[0]
   win_index_2 = win_combination[1]
   win_index_3 = win_combination[2]

   position_1 = @board[win_index_1]
   position_2 = @board[win_index_2]
   position_3 = @board[win_index_3]

   if ((position_1 == "X") && (position_2 == "X") && (position_3 == "X")) || ((position_1 == "O") && (position_2 == "O") && (position_3 == "O"))
     return win_combination
   end
 end
 return false
end


def winner
 if won? != false
   return @board[won?[0]]
 else
   return nil
 end
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








=begin

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
#def position_taken?(board,index)
#  index.to_i
#  if board[index] == " " || board[index] == "" || board[index] == nil
#    false
#  elsif board[index] == "X" || board[index] == "O"
#    true
#  end
#end


=end

end
