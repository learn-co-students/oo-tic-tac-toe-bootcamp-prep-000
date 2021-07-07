class TicTacToe
  
  def initialize
    @board = [' ',' ',' ',' ',' ',' ',' ',' ',' ']
  end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1 
end

def turn_count
  @board.count do |token|
    token == 'X' || token == 'O'
  end 
end

def current_player
  if turn_count % 2 == 0
    return 'X'
  else
    return 'O'
  end
end
    
def move(position, player_token)
  @board[position] = player_token
end

def valid_move?(index)
  if @board[index] != 'X' && @board[index] != 'O' && index.between?(0,8)
    return true 
end
end

def turn
  puts 'Please enter 1-9:'
  input = gets.strip
  index = input_to_index(input)
  if !valid_move?(index)
    turn
  end
    move(index, current_player)
    display_board
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # mid row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # diag1
  [2,4,6] # diag2
  ]

def won?
  WIN_COMBINATIONS.detect do |arr|
    if @board[arr[0]] == @board[arr[1]] && @board[arr[0]] == @board[arr[2]] && @board[arr[0]] != ' '
      return arr
    end
  end
end
       
def full?
  @board.all? do |element|
    element == 'X' || element == 'O'
    end
end

def draw?
 if !won? && full?
   return true
 end
end

def over?
  if full? || won? 
    return true
  end
end

def winner
  if won?
    arr = won?
  return @board[arr[0]]
end
end

def again?
  puts "Play Again? y/n"
  input = gets.strip
  if input == 'y' || input == 'yes'
    play
  end
  if input == 'n' || input == 'no'
    return
  end
end
  

def play
  until over? || draw?
  turn
  end
  if won?
    puts "Congratulations #{winner}!"
  end
  if draw?
    puts 'Cat\'s Game!'
  end
end

end