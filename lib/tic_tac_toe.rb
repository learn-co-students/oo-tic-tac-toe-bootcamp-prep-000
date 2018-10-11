class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  
WIN_COMBINATIONS = 
[
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

def input_to_index(input)
  index = (input.to_i)-1
end

def move(index, character)
  @board[index]=character
end

def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    true
  elsif @board[index] == " " || @board[index] == "" || @board[index] == nil
    false 
  end
end

def valid_move?(index)
  if !position_taken?(index) && index.between?(0,8)
    true
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if 
    valid_move?(index)
    move(index, current_player)
    display_board
  else 
    turn
  end
end

def turn_count
  counter = 0
  @board.each do |board_position|
    if board_position == "X" || board_position == "O"
      counter += 1
    end
  end
  return counter
end

def current_player
  turn_count
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.detect do |win_combination|
  if
      @board[win_combination[0]] == "X" &&
      @board[win_combination[1]] == "X" &&
      @board[win_combination[2]] == "X"
    won = win_combination
  elsif
      @board[win_combination[0]] == "O" &&
      @board[win_combination[1]] == "O"  &&
      @board[win_combination[2]] == "O"
    won = win_combination
  else
    won = false
  end
won 
end
end

def full?  
@board.none?{|i| i == " "}
end

def draw?
  full? && !won?
end

def over?
  if draw? || full? || won?
    true
  end
end

def winner
 if won?
   winner = won?[0]
   @board[winner]
 end
end

def play
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  elsif draw?
    puts "Cat's Game!"
  end
  while !over?
  turn
  play
  end
end
end