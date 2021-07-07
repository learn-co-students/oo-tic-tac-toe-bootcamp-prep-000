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

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(index)
  @board[index] != " " && @board[index] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
  counter = 0
  @board.each do|position|
    if position != " " && position != "" && position != nil
      counter += 1
    end
  end
  counter
end

def current_player
  turn_number = turn_count
  if turn_number%2 != 0
    "O"
  else
    "X"
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  player = current_player
  if valid_move?(index)
    move(index, player)
    display_board
  else
    turn
  end
end

def won?
  WIN_COMBINATIONS.each do|win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
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
  full? && !won?
end

def over?
  won? || full? || draw?
end

def winner
  if won?
  x_wins = won?[0]
    if @board[x_wins] == "X"
      return "X"
    elsif @board[x_wins] == "O"
      return "O"
    else
      nil
    end
  else
    nil
  end
end

def play
  if !over?
    turn
    if won?
      player = winner
      puts "Congratulations #{player}!"
    elsif draw?
      puts "Cat's Game!"
    else
      play
    end
  elsif won?
    player = winner
    puts "Congratulations #{player}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
