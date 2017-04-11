class TicTacToe

def initialize
  @board = Array.new(9, " ")
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

def input_to_index(string)
  string.to_i - 1
end

def move(index, char)
  @board[index] = char
end

def position_taken?(index)
  if (@board[index] == " " || @board[index] == "")
    false
  elsif (@board[index] == "X" || @board[index] == "O")
    true
  else
    false
  end
end

def valid_move?(index)
  if (index.between?(0, 8) && position_taken?(index) == false)
    true
  else
    false
  end
end

def turn_count
  occupied_spaces = 0
  @board.each do |space|
    if (space == "X" || space =="O")
      occupied_spaces += 1
    end
  end
  occupied_spaces
end

def current_player
  if turn_count % 2 == 0
    "X"
  else
    "O"
  end
end

def turn
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  until valid_move?(index) == true
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
  end
  move(index, current_player)
  display_board
end

def won?
  if WIN_COMBINATIONS.any?{|combo|
    (@board[combo[0]] == @board[combo[1]]) && (@board[combo[1]] == @board[combo[2]]) && (@board[combo[0]] == "X" || @board[combo[0]] == "O")
  } == true
  WIN_COMBINATIONS.detect{|combo|
    (@board[combo[0]] == @board[combo[1]]) && (@board[combo[1]] == @board[combo[2]]) && (@board[combo[0]] == "X" || @board[combo[0]] == "O")
  }
else
  false
end
end

def full?
  @board.all? do |space|
    space == "X" || space =="O"
  end
end

def draw?
  if won? != false
    false
  elsif full? == true
    true
  end
end

def over?
  if won? != false
    true
  elsif draw? == true
    true
  end
end

def winner
  def da_winning_combination
    WIN_COMBINATIONS.detect {|combo|
    (@board[combo[0]] == @board[combo[1]]) && (@board[combo[1]] == @board[combo[2]]) && (@board[combo[0]] == "X" || @board[combo[0]] == "O")
  }
#return value is the winning array
  end
  if da_winning_combination == nil
    nil
  else
    @board[da_winning_combination[0]]
  end
end

def play
  until over? == true
    turn
  end
  if won? != false
    puts "Congratulations #{winner}!"
  elsif draw? == true
    puts "Cat's Game!"
  end
end

end
