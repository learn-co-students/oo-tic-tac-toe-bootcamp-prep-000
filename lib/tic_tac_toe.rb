class TicTacToe

def initialize
  @board = [" "," "," "," "," "," "," "," "," "]
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

def input_to_index(input)
  input.to_i - 1
end

def move(index, player)
  @board[index] = player
end

def position_taken?(index)
  if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
    false
  else
    true
  end
end

def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
end

def turn_count
  counter = 0
  @board.each do |move|
    if (move == "X" || move == "O")
      counter += 1
    end
  end
  return counter
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    player = current_player
    move(index, player)
    display_board
  else
    turn
  end
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
  WIN_COMBINATIONS.each do |win|
    if ( win.all?{|i| @board[i] == "O"} || win.all?{|i| @board[i] == "X"} )
      return win
    end
  end
   false
end

def full?
  @board.all?{|i| i != " "}
end

def draw?
  won? == false && full?
end

def over?
  won? != false || draw?
end

def winner
  if win = won?
    @board[win[0]]
  end
end

def play
  until over?
    turn
  end
  puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
end

end
