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
  [2,4,6]
  ]
  
def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(index, player="X")
  @board[index]=player
end

def position_taken?(index)
  if @board[index] == ""|| @board[index] == " " || @board[index] == nil
   false
  else
   true
  end
end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


def turn
  puts "Please enter 1-9"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    puts display_board
  else
  turn
  end
 end
 
 def turn_count
  counter = 0
  @board.each do |turn|
      if turn == "X" || turn == "O"
      counter += 1
    else
      counter += 0
    end
  end
  counter
end


  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O"
  end
end

def won?
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return win_combo
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return win_combo
    end
      false
  end
end

def full?
  !@board.any? { |x| x == " " }
end

def draw?
  if  full?  && !won?
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
  elsif won?.all? {|value| @board[value] == "X"}
    "X"
  elsif won?.all? {|value| @board[value] == "O"}
    "O"
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