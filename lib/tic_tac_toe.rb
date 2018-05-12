class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
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

  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(the_index)
    @board[the_index].strip != ""
  end

  def valid_move?(users_index)
    users_index.between?(0,8) && !position_taken?(users_index)
  end

=begin
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index, current_player(board))
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |spot|
    if spot == "X" || spot == "O" then turns += 1 end
  end
  turns
end

  def turn_count(board)
    board.count{|token| token == "X" || token == "O"}
  end


def current_player(board)
  turn_count(board).even? ? player = "X" : player = "O" 
end

  def current_player(board)
    turn_count(board) % 2 == 0 ? "X" : "O"
  end


def won?(board)
  result = false
  WIN_COMBINATIONS.each do |set|
    if board[set[0]] == "X" && board[set[1]] == "X" && board[set[2]] == "X"
      result = set
      break
    elsif board[set[0]] == "O" && board[set[1]] == "O" && board[set[2]] == "O"
      result = set
      break
    end
  end
  result
end

def full?(board)
  filled = board.all? do |spot|
    spot != " " && spot != ""
  end
end

def draw?(board)
  won?(board) == false && full?(board)
end

def over?(board)
  won?(board) != false || draw?(board)
end

def winner(board)
  outcome = won?(board)
  if outcome != false
    board[outcome[0]]
  else
    nil
  end
end

def play(board)
  until over?(board)
    turn(board)
  end
  letter = winner(board)
  if letter != nil
    puts "Congratulations #{letter}!"
  else
    puts "Cat's Game!"
  end
end
=end

end



