class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

def turn_count()
  counter = 0
  @board.each do |board|
    if board == "X" || board == "O"
      counter += 1
    end
  end
  return counter
end

def current_player()
  turn_count().even? ?  "X" : "O"
end

def turn()
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index,current_player)
    display_board()
  else
    turn()
  end
end

def won?()
  if @board == [" "," "," "," "," "," "," "," "," "]
    return false
  end
  WIN_COMBINATIONS.select do |win_combo|
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]

    position_1 = @board[index_1]
    position_2 = @board[index_2]
    position_3 = @board[index_3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
      (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combo
    else
      false
    end
  end
  return false
end

def full?()
  @board.none? {|i| i == " "}
end

def draw?()
  won?() == false && full?() == true ? true : false
end

def over?()
  if draw?() == true
    return true
  elsif won?() != false && full?() == true
    return true
  elsif won?() != false && full?() == false
    return true
  else
    false
  end
end

def winner()
  WIN_COMBINATIONS.select do |win_combo|
    index_1 = win_combo[0]
    index_2 = win_combo[1]
    index_3 = win_combo[2]

    position_1 = @board[index_1]
    position_2 = @board[index_2]
    position_3 = @board[index_3]

if (position_1 == "X" && position_2 == "X" && position_3 == "X")
  return "X"
elsif   (position_1 == "O" && position_2 == "O" && position_3 == "O")
  return "O"
else
  false
end
end
return nil
end

def play()
  until over?() == true
    turn()
  end
  if won?() != false
    if winner() == "X"
      puts "Congratulations X!"
    elsif winner() == "O"
      puts "Congratulations O!"
    end
  end
if draw?() == true
  puts "Cat's Game!"
end
end

end
