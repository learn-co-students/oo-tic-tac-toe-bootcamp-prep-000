class TicTacToe
  def initialize
    @board=Array.new(9," ")
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

def valid_move?(input)
  !position_taken?(input) && input.between?(0,8)
end

def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  else
    return true
  end
end

def move(index,token)
  @board[index]=token
end

def turn_count
  counter = 0
  @board.each do |i|
    if i == "X" || i == "O"
      counter +=1
    end
  end
  counter
end

def current_player
  if turn_count % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn
  puts "What is your move?"
  input = input_to_index(gets.strip)
  if valid_move?(input)
    move(input,current_player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.each do |combo|
    if (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") ||
      (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
      return combo
    end
  end
  false
end

def full?
  @board.all?{|i| i=="X"||i=="O"}
end

def full?
  @board.all?{|i| i=="X"||i=="O"}
end

def draw?
  if full? == true && won? == false
    return true
  else
    false
  end
end

def over?
  won? || draw? || full?
end

def winner
  if won?
    @board[won?[0]]
  else
    nil
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
