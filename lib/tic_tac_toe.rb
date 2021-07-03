class TicTacToe
  def initialize(board =  nil)
   @board = board || Array.new(9, " ")
end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8]]
 
def input_to_index(user_input)
  user_input.to_i - 1
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
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
end
end

def won?
  # iterate over the @board and see if there's a winning combo, if not return false
  WIN_COMBINATIONS.each do |win_combo|
  if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]]== "X") || (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
     return win_combo
    end
    end
    return false
end


def turn_count
  
  counter=0
 @board.each do |turn|
   if turn == 'X' || turn == 'O'
     counter += 1
end
end
counter
end

def current_player
  turn_count%2 == 0 ? 'X' : 'O'
  end
  
  def move(index, player)
  @board[index] = player

end

def full?
 @board.all? do |letter|
    letter == "X" || letter == "O"
  end
  end



def draw?
  full? && !won?
  end


def over?
  won? || draw? || full?
  end



def winner
  if won?
     @board[won?[0]]
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
end


  
