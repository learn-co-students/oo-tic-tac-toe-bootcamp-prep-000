class TicTacToe
def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
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

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?( index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  turn_counter = 0
  @board.each do |value|
    if value == "X" || value == "O"
turn_counter += 1
end
end
return turn_counter
end

def current_player
num = turn_count
if num % 2 == 0
  return "X"
else
  return "O"
end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
   if valid_move?( index)
    move(index, current_player)
     display_board
   else
     turn
  end
  end

def play
  won?
  draw?
while over? == false do
  turn
end
if won?
  puts "Congratulations #{winner}!"
end
if draw?
  puts "Cat's Game!"
end
end

def won?

empty = 0
counter = 0
 WIN_COMBINATIONS.each do |intArr|

#set variables to board inputs
  i1 = @board[intArr[0]]
  i2 = @board[intArr[1]]
  i3 = @board[intArr[2]]

#check to make sure mathches are not empty board spaces
#and check that board posistion match winning combinations
  if i1 != " " && i2 != " " && i3 != " " && i1 == i2 && i2 == i3 && i1 == i3
#return winning combination
return intArr
#else add 1 to counter
 else
  counter += 1
  #if counter gets to 8 return false as there are no mathches
  if counter == 8
    counter == 0
    return false
  end

 end

 puts counter

 intArr = []
 puts counter
end
end

#full method
def full?
  #check if every element in the board has been filled by either an X or a O
  @board.all? do |element|
 element == "X" || element == "O"
end
end

#draw method
def draw?
if full? && won? == false
  return true
else
  return false
end
end

def over?

if  won? && full? == false && draw? == false
  return true
elsif full? && won?
  return true
elsif draw?
  return true
else
  return false
end

end

def winner
  if won?
  arr = won?
  sym = @board[arr[0]]
return sym
else
  return nil
end
end

end
