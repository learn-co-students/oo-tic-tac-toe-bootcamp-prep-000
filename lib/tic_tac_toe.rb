class TicTacToe
  def initialize()
    @board = Array.new(9, " ")
    
  end
  WIN_COMBINATIONS = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 3, 6],[1, 4, 7],[2, 5, 8],[0, 4, 8],[2, 4, 6]]
  
  def display_board
    printRow(@board[0], @board[1], @board[2])
    puts "-----------"
    printRow(@board[3], @board[4], @board[5])
    puts "-----------"
    printRow(@board[6], @board[7], @board[8])
  end

def printRow(x, y, z)
  puts " #{x} | #{y} | #{z} "
end

def input_to_index(n)
  n.to_i - 1 
end
 
def move(pos, char)
  @board[pos] = char
end

def valid_move?(i)
  if (position_taken?(i) == false) && (i < @board.length) && i > -1
    return true
  else
    return false
  end
end 


def position_taken?(i)
  if @board[i] == "X" || @board[i] == "O"
    return true 
  else
    return false 
  end
end 

def turn()
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  char = current_player()
  if valid_move?(index)
    move(index, char)
  else
    turn()
  end
  display_board()
end

def turn_count()
  turns = 0
  @board.each do |i|
    i == " " ? next : turns += 1
  end
  return turns
end

def current_player()
  turn_count().odd? ? "O" : "X"
end 

def won?()
  WIN_COMBINATIONS.each do |combo|
    if (@board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]) && @board[combo[0]] != " "
      return combo
    end 
  end
  return false
end 

def full?()
  #if there are NO EMPTY SPACES
  @board.none? { |i| i == " " }
end

def draw?()
  #if the board is FULL && nobody has WON
  full?() && !won?()
end

def over?()
  #if someone has WON, or it is DRAW
  won?() || draw?()
end
def winner()
  if won?()
    return @board[won?()[0]]
  end
end

def play()
  #board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  while !over?()
    turn()
  end
  if draw?()
    puts "Cat\'s Game!"
  elsif won?()
    puts "Congratulations #{winner()}!"
  end 
end 
end
