require"pry"
class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

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
  def current_player
    turn_count
    turn_count.odd? ? player = "O" : player = "X"
  end
  def turn_count
    turns = 0
    @board.each do |characters|
      if characters == "X" || characters == "O"
        turns += 1
      end
    end
    turns
  end
  def won?
  WIN_COMBINATIONS.detect do |winning|
    win_index_1 = winning[0]
    win_index_2 = winning[1]
    win_index_3 = winning[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return winning
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winning
end
end
return false
end
def full?
  @board.all? do |character|
    character == "X" || character == "O"
end
end

def draw?
  !won? && full?
end

def over?
  if won? || full?
    return true
  else return false
end
end

def winner
  if winning_game = won?
    @board[winning_game.first]
  end
end

def play
  until over? || draw?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end
end
Pry.start 
puts "Hello"