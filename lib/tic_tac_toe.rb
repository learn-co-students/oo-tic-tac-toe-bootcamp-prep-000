class TicTacToe

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

def display_board
  puts ""
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  input.to_i - 1
end

def move(index, token="X")
  @board[index] = token
end

def position_taken?(index)
  # if the spot the user picked is empty this will return false.
  @board[index] == "X" || @board[index] == "O"
end

def valid_move?(index)
  (0..8).include?(index) && !position_taken?(index)
end

def turn
  puts "Pick a square from 1 to 9:"
  input = gets.strip
  input = input_to_index(input)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end

end

def turn_count
  count = 0
    @board.each do |square|
      if square != " "
        count += 1
      end
    end
  count
end

def current_player
  if turn_count.odd?
    "O"
  elsif turn_count.even?
    "X"
  end
end

def won?
  WIN_COMBINATIONS.each do |combo|
    if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
      return combo
    elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
      return combo
    end
  end

  return false
end

def full?
  #return true if all squares are not empty
  @board.all? {|index| index != " "}
end

def draw?
 !won? && full?
end

def over?
  draw? || won? || full?
end

def winner
  @board[won?[0]] if won?
end

def play
  until over?
    turn
  end

  if won? != false
    puts "Congratulations " + winner + "!"
  elsif draw?
    puts "Cat's Game!"
  end

end

end
