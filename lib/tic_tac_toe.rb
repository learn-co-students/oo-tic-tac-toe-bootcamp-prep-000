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

  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, character = "X")
  @board[index] = character
end

def valid_move?(index)
  if position_taken?(index)
    return false
  elsif index.between?(0, 8)
    return true
  else
 end
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == ""
    return false
  elsif @board[index] == nil
    return false
  else
    return true
 end
end

def turn_count
  turns = 0
  @board.each do |board_slot|
    if board_slot == "O" || board_slot == "X"
      turns += 1
    end
  end
  return turns
end

def over?
  full? || won? || draw?
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
  turn
  end
end

  def current_player
     if turn_count.even?
       "X"
     else
    count = turn_count
      if count.even?
       "X"
      elsif count.odd?
       "O"
    end
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

  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      win_combo.all? {|index|@board[index] == "X"} == true || win_combo.all? {|index|@board[index] == "O"}
  end
end

def winner
  winning_combination = won?
  if winning_combination == nil
    return nil
  elsif @board[winning_combination[0]] == "X"
  return "X"
else
  "O"
  end
end

def full?
    !@board.any? do |board_position|
      board_position == " "
  end
end

def draw?
  full? && !won?
end
end
