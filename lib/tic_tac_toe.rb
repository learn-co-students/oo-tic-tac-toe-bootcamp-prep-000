class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
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

def input_to_index(move)
  move.to_i - 1
end

def move(index, token)
  @board[index] = token
end

def position_taken?(index)
  !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
end

def valid_move?(index)
  index.between?(0, 8) && !position_taken?(index)
end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
    @board.count{|token| token == "X" || token == "O"}
end

def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  index = input_to_index(user_input)
  token = current_player
  if valid_move?(index)
    move(index, token)
    display_board
   else
    puts 'Invalid move'
    turn
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
     if((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
      return win_combination
    else
    end
  end
  nil
end

def full?
  @board.all? {|i| i == "X" || i == "O"}
end

def draw?
  if full? && !won?
    return true
  else won?
    return false
  end
end

def over?
  if draw? || won? || full?
    return true
  end
end

def winner
  if won?
    return @board[won?[0]]
  end
end

def play
  until over? == true || won? == true
    turn
  end
  if winner
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  else
    return nil
  end
end
end
