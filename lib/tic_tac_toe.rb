# Helper Method
class TicTacToe

  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]  # Middle row
  # ETC, an array for each win combination
]

def won?
win_combination=[]
win=false
  WIN_COMBINATIONS.each do |comb|
    comb.each do |i|
      win_combination<<@board[i]
    end
    if (win_combination.all?{|i| i=='X'})||(win_combination.all?{|i| i=='O'})
      return comb
    else win_combination=[]
    end
  end
  return win
end

def full?
  @board.none?{|i| i==' '}
end

def draw?
if full? && (won? == false)
  return true
else return false
end
end

def over?
  if full? || (won? != false) || draw?
    return true
  else return false
  end
end

def winner
winner=nil
comb=[]
if over? && won?
comb=won?
winner = @board[comb[0]]
end
return winner
end

def turn_count
  cnt=0
  @board.each do |val|
  cnt+=1 if (val == "X" || val =="O")
  end
  return cnt
end

def current_player
player = "X"
turn = turn_count
if (turn.odd? == true)
  player = "O"
end
return player
end
# Helper Methods
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

def turn_count
  cnt=0
  @board.each do |val|
  cnt+=1 if (val == "X" || val =="O")
  end
  return cnt
end

def current_player
player = "X"
turn = turn_count
if (turn.odd? == true)
  player = "O"
end
return player
end

def winner
winner=nil
comb=[]
if over? && won?
comb=won?
winner = @board[comb[0]]
end
return winner
end
# Define your play method below
def play
  until over? do
    turn
  end
  if draw?
    puts "Cat's Game!"
  else
    puts "Congratulations #{winner}!"
  end
end
end
