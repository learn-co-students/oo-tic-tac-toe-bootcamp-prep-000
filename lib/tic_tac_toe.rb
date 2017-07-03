class TicTacToe

def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
  @board = board
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
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(input)
  @index = input.to_i - 1
end

def move(index, token = "X")
  @index = index
  @board[@index] = token
end

def position_taken?(index)
  @index = index
  if @board[@index] == "" || @board[@index] == " " || @board[@index] == nil
    false
  else
    true
  end
end

def valid_move?(index)
  @index = index
  if @index.between?(0, 8) && position_taken?(index) == false
    true
  else
    false
  end
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
  count = 0
  @board.each do |taken|
    if taken == "X" || taken == "O"
      count += 1
    end
end
return count
end

def current_player
  which_turn = turn_count.to_i
  if which_turn.even?
    return "X"
  else
    return "O"
  end
end

def won?
  count = 0
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all?{|i| @board[i] == "X"} || win_combo.all?{|i| @board[i] == "O"}
      return win_combo
    else
      count += 1
    end
    end
    if @board.all? { |e| e == " "} || @board.all? { |e| e == ""}
      return false
  end
  if count = 8
    return false
  end
end

def full?
  if @board.detect { |e| e == "" } || @board.detect { |e| e == " " }
    return false
  else
    true
  end
end

def draw?
  if won? === false && full? === true
    return true
  elsif won? != false && full? === false
    return false
  else
    false
  end
end

def over?
  if won? != false || full? === true || draw? === true
    return true
  end
end

def winner
  if won? != false && over? === true
    return @board[won?[0]]
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  end
  if draw?
    puts "Cat's Game!"
  end
end

end
