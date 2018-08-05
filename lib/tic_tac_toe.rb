class TicTacToe
  
  def initialize
    @board= [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  
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

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  now_you = current_player
  if valid_move?(index)
    move(index,now_you)
    display_board
  else
    turn
  end
end

def play
 until over? do
   turn
 end
 if won?
   will=winner
   puts "Congratulations #{will}!"
 elsif draw?
  puts "Cat's Game!"
end
end

def turn_count
  occupied_spaces=0
  @board.each do |turn|
    if (turn=="X") || (turn=="O")
     occupied_spaces+=1
   else NIL
 end
 end
return occupied_spaces
end 

def current_player
  total=turn_count
  if total%2==1
    return "O"
  elsif total%2==0 || total==0
    return "X"
  end
end

def won?
  if (@board[0]=="X" && @board[1]=="X" && @board[2]=="X")||(@board[0]=="O" && @board[1]=="O" && @board[2]=="O")
    return WIN_COMBINATIONS[0]
    
  elsif (@board[3]=="X" && @board[4]=="X" && @board[5]=="X")||(@board[3]=="O" && @board[4]=="O" && @board[5]=="O")
    return WIN_COMBINATIONS[1]
  
  elsif (@board[6]=="X" && @board[7]=="X" && @board[8]=="X")||(@board[6]=="O" && @board[7]=="O" && @board[8]=="O")
    return WIN_COMBINATIONS[2]
  
  elsif (@board[0]=="X" && @board[3]=="X" && @board[6]=="X")||(@board[0]=="O" && @board[3]=="O" && @board[6]=="O")
    return WIN_COMBINATIONS[3]
  
  elsif (@board[1]=="X" && @board[4]=="X" && @board[7]=="X")||(@board[1]=="O" && @board[4]=="O" && @board[7]=="O")
    return WIN_COMBINATIONS[4]
  
  elsif (@board[2]=="X" && @board[5]=="X" && @board[8]=="X")||(@board[2]=="O" && @board[5]=="O" && @board[8]=="O")
    return WIN_COMBINATIONS[5]
  
  elsif (@board[0]=="X" && @board[4]=="X" && @board[8]=="X")||(@board[0]=="O" && @board[4]=="O" && @board[8]=="O")
    return WIN_COMBINATIONS[6]
  
  elsif (@board[6]=="X" && @board[4]=="X" && @board[2]=="X")||(@board[6]=="O" && @board[4]=="O" && @board[2]=="O")
    return WIN_COMBINATIONS[7]
  else
    return FALSE
  end
end

def full?
  @board.all?{|number| number=="X"||number=="O"} 
end

def draw?
  if full? && !won?
    TRUE
  else
    FALSE
end
end

def over?
  if draw? || (full? && won?) || (!full? && won?)
    TRUE
  else
    FALSE
  end
end

def winner
  if got = won?
    return @board[got.first]
  end
end

end