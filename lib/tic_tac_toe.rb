class TicTacToe 

def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
WIN_COMBINATIONS = [ 
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [6,4,2],
  ]
  
def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
def play
i = 0
until over?  
i += 1
display_board
turn
end
if won? != false
  puts "Congratulations #{winner}!"
   
elsif draw? 
  puts "Cat's Game!"
end
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

def turn_count 
  turn = 0 
  @board.each do |index|
    if index == "X" || index == "O"
    turn += 1
  end 
end 
turn 
end 

def current_player
  turn_count.even? ? "X" : "O" 
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
  WIN_COMBINATIONS.each{|win| 
  if win.all?{|i| @board[i] == "X"}
   return win 
  elsif win.all?{|i| @board[i] == "O"}
  return win
  
end}
false 
end

def full? 
if @board.none?{|i| i == " "} && @board.none?{|i| i == ""}
  true 
else
false
end  
end

def draw?
if full?
    if won? == false
  true 
end 
  else 
   return false 
  end 
end

def over?
    if draw?
      true
    elsif won? == false  
       false 
    elsif won? != false
     return true 
    elsif @board.any?{ |i| i == " "}
    return false 
    else 
      false
  end
end

def winner
  if won? == false
    nil
  elsif won?.all?{ |i| @board[i] == "X"} 
    "X"
  elsif won?.all?{ |i| @board[i] == "O"}
    "O"
  else 
    nil 
  end
end

end