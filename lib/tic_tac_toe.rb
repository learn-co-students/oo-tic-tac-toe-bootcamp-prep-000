class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  index = input.to_i
  index = index -1

end

def move(position,character)
  @board[position] = character
end

def position_taken?(position)
  if @board[position] == " "
    return false
  else
    true
  end
end


def valid_move?(position)
  if position_taken?(position)== false && position < 8 && position > -1
    true
  else
    false
  end
end

def turn_count
  i = 0
  count = 0

9.times do
    if @board[i] != " "
count = count + 1
    end
          i = i+1
  end
  return count
end



def current_player

if turn_count % 2 == 0
  return "X"
end

if turn_count % 2 != 0
  return "O"
end

end


def turn
  display_board
  input = gets.chomp
  position = input_to_index(input)

if valid_move?(position)
  move(position,current_player)
else
  turn
end

end

def won?

i=0
8.times do
if @board[WIN_COMBINATIONS[i][0]] == @board[WIN_COMBINATIONS[i][1]] && @board[WIN_COMBINATIONS[i][1]] == @board[WIN_COMBINATIONS[i][2]] && @board[WIN_COMBINATIONS[i][0]] != " "
  return WIN_COMBINATIONS[i]
end
i = i + 1
end

if full?
  return false
end


end





def full?
  if turn_count == 9
    true
  else
    false
  end
end

def draw?

if full? && won? == false
  return true
end

if won? == true
  return false
end

if full? == false && won? == false
  return false
end

end #end of draw?


def over?
  if draw?
    return true
  end

  if won?
    return true
  end

  if draw? == false && won? == false
    return false
  end
end #ends over?


def winner

if won?
  return @board[won?[0]]
end



end



def play

until over? == true






  turn

end #ends UntilOver?

if draw?
  puts "Cat's Game!"
return
end #ends draw?

if won?
puts "Congratulations #{winner}!"
return
end #ends win?

end #ends play



end #ends the class
