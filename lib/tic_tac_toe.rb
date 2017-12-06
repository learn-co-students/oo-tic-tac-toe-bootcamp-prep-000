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

  ##################################

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

##################################

def input_to_index(user_input)
  user_input.to_i - 1
end

##################################

def move(index, value)
  @board[index]= value
end

##################################

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

##################################

def valid_move?(index)
  if index.between?(0,8) && position_taken?(index) == false
    true
  else
    false
  end

end

##################################

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index) == true
    move(index, current_player)
    display_board
    #turn(board)
  else
    turn
  end
end

##################################

def turn_count
  counter = 0
  @board.each do |count|
    if count == "X"
      counter += 1
    elsif count == "O"
      counter += 1
    end
  end
  counter
end

##################################

def current_player
  if turn_count % 2 == 0
    return "X"
  elsif turn_count% 2 != 0
    return "O"
  end
end

##################################

def won?

  WIN_COMBINATIONS.each do |win_combination|
    win_indexes = win_combination.all?{|index| position_taken?(index)}
      if win_indexes === true
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]

          if position_1 == "X" && position_2 == "X" && position_3 == "X"
              return win_combination
              #winner = "X"
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
              return win_combination
            #  winner = "O"

          end
        end
      end
    return false
end

#######################

def full?
  @board.none?{|index| index == " "}
end

######################

def draw?
  if full? && !won?
    return true
  elsif !won? && !full?
    return false
  elsif won?
    return false
  end
end

#######################

def over?
  if won? || draw? || full?
    return true
  else
    return false
  end
end

########################

def winner
  if over?
    return @board[won?[0]]
  end
end

##################################

def play
  until over?
    turn
  end

if won?
  puts "Congratulations #{winner}!"
elsif draw?
  puts "Cat\'s Game!"
end
end

end
