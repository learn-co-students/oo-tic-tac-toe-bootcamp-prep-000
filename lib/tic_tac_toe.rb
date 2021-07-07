
class TicTacToe

  ##initialize method should set a @board variable equal to a new, empty array that represents the game board.

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  #Define a WIN_COMBINATIONS constant within the TicTacToe class, and set it equal to a nested array filled with
  #the index values for the various winning combinations possible in Tic Tac Toe.

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

  #DISPLAY_BOARD prints the current board representation based on the @board instance variable.

  def display_board
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end


  #INPUT_TO_INDEX can pass user input (in the form of a string, e.g., "1", "5", etc.) and have
  #it return to us the corresponding index of the @board array

  def input_to_index(user_input)
    return user_input.to_i - 1
  end

  #MOVE takes in two arguments: the index in the @board array that the player chooses and the
  #player's token (either "X" or "O"). The second argument, the player's token, should default to "X".

  def move(index_arr, token = "X")
    @board[index_arr] = token
  end

  #POSITION_TAKEN? evaluating the user's desired move against the Tic Tac Toe board and checking to
  #see whether or not that position is already occupied.

  def position_taken?(index)

    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end


  #VALID_MOVE? accepts a position to check and returns true if the move is valid and false or nil if not.
  #A valid move means that the submitted position is present on the game board & not already filled with a token.

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  #TURN encapsulate the logic of a single complete turn



  def turn
    puts "Please enter 1-9:"
    @input = gets.strip
    @index = input_to_index(@input)
    if valid_move?(@index)
      move(@index, current_player)
      display_board
    else
      turn
    end
  end

  #TURN_COUNT returns the number of turns that have been played based on the @board variable.

  def turn_count
    #set counter variable
    counter = 0
    #iterate through board, looking for number of plays, if found, increase counter variable
    @board.each do |play|
      if play == "X" || play == "O"
        counter += 1
      end
    end
    return counter
  end

  #CURRENT_PLAYER uses the #turn_count method to determine if it is "X"'s or "O"'s turn.

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  #WON? return false/nil if there is no win combination present in the board and return
  #the winning combination indexes as an array if there is a win.

  def won?

      #for each win_combination in WIN_COMBINATIONS

      WIN_COMBINATIONS.detect do |win_combination|

      # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
      # grab each index from the win_combination that composes a win, and load the value of the board at position x

      position_1 = @board[win_combination[0]] # load the value of the board at win_index_1
      position_2 = @board[win_combination[1]] # load the value of the board at win_index_2
      position_3 = @board[win_combination[2]] # load the value of the board at win_index_3

      position_1 == position_2 && position_2 == position_3 && position_taken?(win_combination[0])

    end

  end

  #FULL returns true if every element in the board contains either an "X" or an "O".

  def full?
    !@board.include?(' ')
  end

  #DRAW  returns true if the board is full and has not been won, false if the board is
  #won, and false if the board is neither won nor full.

  def draw?
    !won? && full?
  end

  #OVER returns true if the board has been won or is full (i.e., is a draw).

  def over?
    won? || draw? || full?
  end

  #WINNER return the token, "X" or "O", based on who has won the game.

  def winner
    if won?
        @board[won?[0]]
    end
  end


  #PLAY

  def play
    display_board
  #  until the game is over
    until over?
  #    take turns
      turn
    end
  #  if the game was won
    if won?
  #    congratulate the winner
      puts "Congratulations #{winner}!"
  #  else if the game was a draw
    elsif draw?
  #    tell the players it has been a draw
      puts "Cat's Game!"
    end
  end
end

=begin

OLD CODE

#DEFINE WIN COMBINATIONS

WIN_COMBINATIONS =
[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
]

#DISPLAY_BOARD prints the current board representation based on the @board instance variable.

def display_board(board)
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

#INPUT_TO_INDEX

def input_to_index(arg)
  return arg.to_i - 1
end

#MOVE

def move(array, index, value)
  array[index] = value
end

#POSITION_TAKEN

def position_taken?(board, index)

  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

#VALID_MOVE

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

#TURN

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

#TURNCOUNT

def turn_count(board)
  #set counter variable
  counter = 0
  #iterate through board, looking for number of plays, if found, increase counter variable
  board.each do |play|
    if play == "X" || play == "O"
      counter += 1
    end
  end
  return counter
end

#CURRENT_PLAYER

def current_player(board)
  if turn_count(board) % 2 == 0
    return "X"
  else
    return "O"
  end
end

#WON

def won?(board)

    #for each win_combination in WIN_COMBINATIONS

    WIN_COMBINATIONS.detect do |win_combination|

    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win, and load the value of the board at position x

    position_1 = board[win_combination[0]] # load the value of the board at win_index_1
    position_2 = board[win_combination[1]] # load the value of the board at win_index_2
    position_3 = board[win_combination[2]] # load the value of the board at win_index_3

    position_1 == position_2 && position_2 == position_3 && position_taken?(board, win_combination[0])
  end
end

#FULL

def full?(board)
  !board.include?(' ')
end

#DRAW

def draw?(board)
  !won?(board) && full?(board)
end

#OVER

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

#WINNER

def winner(board)
  if won?(board)
      board[won?(board)[0]]
  end
end


#PLAY

def play(board)

#  until the game is over
  until over?(board)
#    take turns
    turn(board)
  end


#  if the game was won
  if won?(board)
#    congratulate the winner
    puts "Congratulations #{winner(board)}!"
#  else if the game was a draw
  elsif draw?(board)
#    tell the players it has been a draw
    puts "Cats Game!"
  end

end


=end
