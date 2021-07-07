class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, character = "X")
  @board[index] = character
end

# code your #valid_move? method here
def valid_move?(index)
  if position_taken?(index) == false && (index >= 0 && index <= 8)
    true
  else
    false
  end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else 
    true
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player = current_player
  if valid_move?(index)
    move(index, player)
    display_board
  else
    turn
  end
end

# Define your play method below

def turn_count
  counter = 0
  @board.each do |turn|
    if turn == "X" || turn == "O"
      counter += 1
    end
  end
  return counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

# Helper Method
def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
    ]
    
def won?
  WIN_COMBINATIONS.each do |win|
    if position_taken?(win[0]) == true && @board[win[0]] ==  @board[win[1]] && @board[win[1]]== @board[win[2]] && @board[win[0]] == @board[win[2]]
      return win
    end
  end
  return false
end

def full?
  @board.all? do |position| 
    position == "X" || position == "O"
  end
end

def draw?
  if won? == false
    return true
  elsif won? == true
    return false
  end
end
  
def draw?
  if won? == false && full? == true
    true
  end
end

def over?
  if won? || draw? || full?
    true
  end
end

def winner
  if won?
    win_combo = won?
    return @board[win_combo[0]]
  end
end

def play
  while !over?
    turn
  end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
  end
end

end