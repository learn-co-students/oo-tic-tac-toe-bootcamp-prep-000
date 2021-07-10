class TicTacToe

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal L -> R
  [2,4,6]  # Diagonal R -> L
]

def display_board
  puts(" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
  puts("-----------")
  puts(" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
  puts("-----------")
  puts(" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
end

def input_to_index(user_input)
  if(user_input.to_i)
    num = user_input.to_i
    return num - 1
  else
    return -1
  end
end


def move(position, character="X")
#position = gets.to_i
  @board[position] = character
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def turn
  character = current_player
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if (valid_move?(index))
    move(index, character)
    display_board
  else
    puts "Enter valid move"
    turn
  end
end

def turn_count
  count = 0
  @board.each do |i|
    if(i != " ")
      count += 1
    end
  end
  return count
end

def current_player
  if(turn_count % 2 == 0)
    return "X"
  else
    return "O"
  end
end

def won?()
  if(@board.any?{|i| i != "" || i != " "})
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0] # gets index positios
      win_index_2 = win_combination[1] # gets index positios
      win_index_3 = win_combination[2] # gets index positios

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if(position_1 != " " && position_1 == position_2 && position_2 == position_3)
        return win_combination
      end
    end
  end
  return false
end


def full?()
  i = 0
  while(i < @board.length)
    if !position_taken?(i)
       return false
     end
     i +=1
     # elsif draw?(board)
     # return true
    end
    return true
end

def draw?()
if won?
  return false
elsif full?
  return true
else
  return false
  end
end

def over?()
  # if(draw?(board))
  #   return true
   if won? || draw?
     return true
  else
    return false
    end
end


def winner
  if won?()
    arr = won?
    value = arr[0]
    return @board[value]
  else
    return nil
  end
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations " + winner + "!"
  elsif draw?
    puts "Cat's Game!"
  end
end


end
