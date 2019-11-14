require 'pry'
class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [2,4,6],
  [0,4,8]
]

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

def move(index, token = "X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] != " "
    true
  else
    false
  end
end

def valid_move?(position)
  if position.between?(0,8) && !position_taken?(position)
    true
  else
    false
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn
  puts "Specify position 1-9"
  input = gets.strip
  input = input_to_index(input)
  if valid_move?(input)
    move(input, current_player)
    display_board
  else
    puts "invalid"
    turn
  end
end

def won?
  WIN_COMBINATIONS.each do |combination|
    #puts "combination: #{combination}"
    cur_combination = [@board[combination[0]], @board[combination[1]], @board[combination[2]]]
    #puts "values on board: #{cur_combination}"
    if cur_combination == ["X","X","X"] || cur_combination == ["O","O","O"]
      return combination
    end
  end
  #puts "All combinations checked, no winner."
  false
end

def full?
  if @board.count{|cell| cell == "X" || cell == "O"} == @board.length
    true
  else
    false
  end
end

def draw?
  if full? && !won?
    true
  else
    false
  end
end

def over?
  if full? || won? || draw?
    true
  else
    false
  end
end

def winner
  if won?
    @board[won?[0]]
  end
end

def play
  until over?
    turn()
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  else
  end
end

end
