class TicTacToe
#####################################################
  def initialize
    @board = " "," "," "," "," "," "," "," "," "
  end
#####################################################
  WIN_COMBINATIONS = [
  [0,1,2], # Top row 0
  [3,4,5], # Middle row 1
  [6,7,8], # bottom row 2

  [0,3,6], # left column 3
  [1,4,7], # middle column 4
  [2,5,8], # right col 5

  [0,4,8], # right diagonal 6
  [2,4,6] # left diagonal 7
  ]
#####################################################
def position_taken?(index)  #Checks to see if index is empty
  if @board[index] == " "  ||  @board[index] == ""  ||  @board[index] == nil
    return false
  end
return true
end
#####################################################
def won?() #Fixed! Switched to WIN_COMBINATIONS.each do |x| :)
  WIN_COMBINATIONS.each do |i|
    if @board[i[0]] == "X" && @board[i[1]] == "X" && @board[i[2]] == "X"
  return i
elsif @board[i[0]] == "O" && @board[i[1]] == "O" && @board[i[2]] == "O"
      return i
    end
  end
    return false
  end
#####################################################
  def current_player()
    turn_count() % 2 == 0 ? "X" : "O"
  end
#####################################################
def turn_count()
  count = 0
  for i in @board
    if i == " "
      count += 0
    else
      count += 1
    end
  end
    return count
end
#####################################################
  def play()
   while !over?() && !won?() && !draw?() #had to add won/board checks here
      turn()
    end
      if won?()
      puts "Congratulations #{winner()}!"
    end
        puts "Cats Game!"
  end
#####################################################
  def display_board()
  puts [" #{@board[0]} | #{@board[1]} | #{@board[2]} "]
  puts ["-----------"]
  puts [" #{@board[3]} | #{@board[4]} | #{@board[5]} "]
  puts ["-----------"]
  puts [" #{@board[6]} | #{@board[7]} | #{@board[8]} "]
end
#####################################################
def input_to_index(user_input)
  user_input.to_i - 1
end
#####################################################
def move(index, current_player = "X")
  index = input_to_index(index)
  @board[index] = current_player
end
#####################################################
def valid_move?(index)
  index = input_to_index(index)
  index.between?(0,8) && !position_taken?(index)
end
#####################################################
def full?()
	if @board.include?(" ")       #if the board has any empty spaces, it's not full
		return false
	end
	return true
end
#####################################################
def turn()
  puts "Please enter 1-9:"
  input = gets.strip.to_i
  if valid_move?(input)             #if move's valid
    move(input, current_player())   #make move; removing def x req'd +current_player
    display_board()                 #show board
  else
    turn()                          #else invoke turn again
  end
end
#####################################################
def draw?()
	if full?() && !won?()        # if board’s full and no one’s won
		return true                # it’s a draw
	else
		return false
end
end
#####################################################
def over?()
	if full?()                   #if the board's full
		return true                #the game's over
	end
return false                   # >_> otherwise it's not
end
#####################################################
def winner()
victor_krum = won?() ? @board[won?[0]] : nil
return victor_krum            #even though he got Imperiused and didn't win the Triwizard Tournament
end
end
