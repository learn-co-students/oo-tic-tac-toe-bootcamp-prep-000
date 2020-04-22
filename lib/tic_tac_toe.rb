class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
 WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def board
    @board
  end
  
def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(number)
 input = number.to_i
return input - 1
end


def move(index, charachter = "X")
@board[index] = charachter
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end
  
def turn_count()
count = 0
 @board.each do |space|
  if space != " "
   count += 1
 end
end
return count
end

def current_player()
  count = turn_count()
  if count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn()
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  space = valid_move?(index)
  if space == true
    charachter = current_player()
    move(index, charachter)
  else 
    turn()
  end
  display_board()
end

def win_combo()
  WIN_COMBINATIONS.select do |winner|
    (@board[winner[0]] =="X" && @board[winner[1]] == "X" && @board[winner[2]] == "X") || (@board[winner[0]] =="O" && @board[winner[1]] == "O" && @board[winner[2]] == "O")
  end
end

def won?() 
 win_combo().first
end

def full?()
@board.none? {|i|
i == " "
}
end

def draw?()
full?() && !won?()
end

def over?()
 full?() || won?() || draw?()
end

def winner()
winning_board = won?()
if winning_board == nil
  return nil
end

winning_char = @board[win_combo()[0][0]]
if winning_board != nil 
  return winning_char
end
end

def play()
  until over?()
  turn()
  end
  if over?()
  if won?()
  player = winner()
  puts "Congratulations #{player}!"
  elsif draw?() == true
  puts "Cat's Game!"
end
end
end


  
end