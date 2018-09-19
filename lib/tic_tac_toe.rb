class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

WIN_COMBINATIONS = [
  [0,1,2],  # row1
  [3,4,5],  # row2
  [6,7,8],  # row3
  [0,3,6],  # column1
  [1,4,7],  # column2
  [2,5,8],  # column3
  [0,4,8],  # diag left to right
  [2,4,6]   # diag right to left
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

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end


def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end


def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    player_token = current_player
    move(index, player_token)
    display_board
  else
    turn
  end
end

def turn_count
  counter = 0
  @board.each do |place|
    if place == "X" || place == "O"
      counter += 1
    end
  end
  return counter
end

def current_player
  if turn_count.even?
    player = "X"
  else
    player = "O"
  end
  return player
end


def won?
  WIN_COMBINATIONS.each do |wincombo| 
    if (@board[wincombo[0]]) == "X" && (@board[wincombo[1]]) == "X" && (@board[wincombo[2]]) == "X" 
      return wincombo 
    elsif (@board[wincombo[0]]) == "O" && (@board[wincombo[1]]) == "O" && (@board[wincombo[2]]) == "O" 
      return wincombo 
      end 
  end 
  false 
end



def full?
  if @board.detect {|space| space == " " || space == nil}
    return false
  else
    return true
  end
end



def draw?
  if !(won?) && full?
    return true
  else
    false
  end
end



def over?
  if full? || draw? || won?
    return true
  else
    return false
  end
end


def winner
  WIN_COMBINATIONS.each do |wincombo| 
    if (@board[wincombo[0]]) == "X" && (@board[wincombo[1]]) == "X" && (@board[wincombo[2]]) == "X" 
      return "X" 
    elsif (@board[wincombo[0]]) == "O" && (@board[wincombo[1]]) == "O" && (@board[wincombo[2]]) == "O" 
      return "O"
      end 
  end 
  nil 
end



def play
  until over?
    turn
  end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
end


end
