class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
 WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]
  
def display_board

puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "

end

def input_to_index(input)
input = input.to_i
input - 1
end
  
  
def move(index, token="X")
  
@board[index] = token
end  
  
  
def position_taken?(index)
if @board[index] == " "
  false
else
  true
end
end


def valid_move?(index)

if (index < 9) && (index >= 0) && @board[index] == " "
  true
    else
  false
end
end

def turn

  puts "Please enter 1-9:"
  movey = gets.strip
  movey = input_to_index(movey)
  if valid_move?(movey)
  move(movey, current_player)
  display_board
else
  turn
end

end


def turn_count
  counter = 0
  @board.each do |val|
    if val == "X" || val == "O"
      counter += 1
    else
  end
  end
  counter
end


def current_player

turncount = turn_count
if turncount % 2 == 0
  "X"
else
  "O"
end
end

  def won?
    gotxwin = false
    gotowin = false
    windex = []
  WIN_COMBINATIONS.each do |blah| 
    
   if blah.all?{|numb| @board[numb] == "X"}
   gotxwin = true
   windex = blah
  
   elsif blah.all?{|numb| @board[numb] == "O"}
   gotowin = true
   windex = blah
  end
  
  end
  
   if gotxwin && gotowin
    false
  elsif gotxwin || gotowin
    windex
  else
  false
  end
  
end
  
def full?
  
@board.all?{|token| token == "X" || token == "O"}
  
end  
  

def draw?
  
  if !won? && full?
    true
  else
    false
  end
    
end 
  
  
def over?

if won? || draw? || full?
  true
else
  false
end
   
end  

def winner
  
if !won?
    nil  
  
elsif @board[won?[0]] == "O"
 "O"
elsif @board[won?[0]] == "X"
 "X"
 
end
end

def play
  until over?
  turn
end
if winner
  puts "Congratulations #{winner}!"
  elsif draw?
  puts "Cat's Game!"
end
end


  
end

