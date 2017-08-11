class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],  #Top row
    [3,4,5],  #Middle row
    [6,7,8],  #Bottom row
    [0,3,6],  #First column
    [1,4,7],  #Seccond column
    [2,5,8],  #Third column
    [0,4,8],  #Diaginal top left to bottom right
    [2,4,6]   #Diaginal top right to bottom left
  ]

def initialize
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
end

#Prints the board in the console
def display_board
  seperator = "-----------"
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts seperator
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts seperator
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

#Convert the user input to to the board array index
def input_to_index(user_input)
  user_input.to_i - 1
end

#Put the players symbol in the selected postion
def move(index, current_player)
  @board[index] = current_player
end

#Ensure the position is empty
def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

#Check to make sure the position entered is valid and empty
def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

#Pormps player for a move selection then checks if its valid and makes the move
def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

#Counts the number of turns taken by how many spaces have a token
def turn_count
  count = 0
  @board.each do |token|
    if token.downcase == "x" || token.downcase == "o"
      count += 1
    end
  end
  count
end

#Figures current player buy weather the move count is even or odd
def current_player
  turn_count  % 2 == 0 ? "X" : "O"
end

#Check to see if X or O has completed a winning combination
def won?
  WIN_COMBINATIONS.each do |combo|
    if combo.all? { |i| @board[i].downcase == "x"}
      return combo
    elsif combo.all? { |i| @board[i].downcase == "o"}
      return combo
    end
  end
  return false
end

#Check for a full game board
def full?
  @board.all? { |e| !(e.nil? || e == " ") }
end

#Check to see if the game ends in a draw
def draw?
  !won? && full?
end

#Check if the game is over because someone won or the game is a draw
def over?
  if won?
    puts "Congratulations #{winner}!"
    return true
  elsif draw?
    puts "Cat's Game!"
    return true
  else
    return false
  end
end

#Return the winner
def winner
  if won?
    @board[won?[0]]
  else
    return nil
  end
end

#Play the game until the board is full or someone has won
def play
  #turns = 0
  until over?
    turn
  end
end

end
