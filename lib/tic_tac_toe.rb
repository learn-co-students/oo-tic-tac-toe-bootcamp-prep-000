class TicTacToe
  
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end
  
  def board=(board)
    @board = board
  end
  
  def board
    @board
  end
  
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [0,3,6],# Middle row
  [6,7,8],  # Bottom row
  [0,4,8],  # First column
  [1,4,7], # Second column
  [2,5,8], #Third column #Diagonal column
  [2,4,6], #Diagonal column
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

def move(index, current_player = "X")
  @board[index] = current_player
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
  if valid_move?(index) == true
    move(index, current_player)
    display_board
  else
      turn
  end
end

def turn_count
	@board.count{|token| token == "X" || token == "O"}
end

def current_player
	turn_count % 2 == 0 ? "X" : "O"
end

def won?

  WIN_COMBINATIONS.each do |combo|
    win_index1 = combo[0]
    win_index2 = combo[1]
    win_index3 = combo[2]

    position_1 = @board[win_index1]
    position_2 = @board[win_index2]
    position_3 = @board[win_index3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combo
    end
  end
  return false
end
  
def full?
  if @board.all? {|full| full == "X" || full == "O"}
    true
  else
    false
  end
end
  
def draw?
  did_win = won?
  is_full = full?
  if did_win == false && is_full == true
     true
  elsif did_win == false && is_full == false
     false
  elsif did_win == true
     false
  end
end

def over?
  if(won? != false) || (full? == true) || draw? == true
    true
  else
    false
  end
end


def winner
  if won? == false
    return nil
  end
  WIN_COMBINATIONS.each do |combo|
    win_index1 = combo[0]
    win_index2 = combo[1]
    win_index3 = combo[2]

    position_1 = @board[win_index1]
    position_2 = @board[win_index2]
    position_3 = @board[win_index3]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
      return "X"
    elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return "O"

    end
  end
end

def play
  while over?  == false do
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end

