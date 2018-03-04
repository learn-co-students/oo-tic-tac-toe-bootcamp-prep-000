class TicTacToe
  def initialize(board=nil)
    @board=board || Array.new(9, " ")
  end

  WIN_COMBINATIONS= [
 [0, 1, 2],
 [3, 4, 5],
 [6, 7, 8],
 [0, 3, 6],
 [1, 4, 7],
 [2, 5, 8],
 [0, 4, 8],
 [2, 4, 6]
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

def move(index, character="X")
  @board[index]=character
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  if current_player == "X"
    character = "X"
  elsif current_player == "O"
    character = "O"
  end
  if valid_move?(index)
    move(index, character)
    display_board
  else
    turn
  end
end

def turn_count
  counter=0
  @board.each do |turn|
    if turn != " " && turn != ""
      counter += 1
    end
  end
  return counter
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def won?
    WIN_COMBINATIONS.each do |combination|
    win_index_1=combination[0]
    win_index_2=combination[1]
    win_index_3=combination[2]

    position_1=@board[win_index_1]
    position_2=@board[win_index_2]
    position_3=@board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combination
    else
      false
    end
  end
  return false
end

def full?
  @board.all? do |index|
    index == "X" || index == "O"
  end
end

def draw?
  if !won? && full?
    true
  else
    false
  end
end

def over?
  if won? || full? || draw?
    true
  else
    false
  end
end

def winner
  if won?
    array = won?
      if @board[array[0]] == "X"
          return "X"
      elsif @board[array[0]] == "O"
          return "O"
      else
          return nil
      end
  end
end

def play
  until over?
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
