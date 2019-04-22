class TicTacToe
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8],[2,4,6]]
  def initialize
    @board = Array.new(9, " ")
  end
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

def move(index, current_player = "X")
  @board[index] = current_player
end
def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?( index)
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
  @board.reduce(0) {|count, place| count + (place == "X" || place == "O" ? 1 : 0)}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
WIN_COMBINATIONS.each do |comb|
  return comb if @board[comb[0]] == @board[comb[1]] && @board[comb[0]] == @board[comb[2]] && (@board[comb[0]] == "X" || @board[comb[0]] == "O")
  end
  return false
end
  
def full?
  @board.all? {|place| place == "X" || place == "O"}
end

def draw?
  !won? if full?
end

def over?
  won? || draw?
end

def winner
  won? ? @board[won?[0]] : nil
end

def play
  turn until over?
  puts "Congratulations #{winner}!" if winner
  puts "Cat's Game!" if draw?
end
  
end
  