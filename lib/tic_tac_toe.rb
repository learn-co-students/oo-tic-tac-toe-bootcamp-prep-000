# April 1, 2018
# Laura Nadolski
# Flatiron Bootcamp - Intro to Ruby

# Tic Tac Toe - OO
# A simple tic tac toe game coded in Ruby.

class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left column
  [1, 4, 7], # Middle column
  [2, 5, 8], # Right column
  [0, 4, 8], # Forward-slash diagonal
  [2, 4, 6], # Backward-slash diagonal
  ]

# #display_board prints the current board representation.

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

# #input_to_index converts the user-inputted location of the desired move to the board index (player views spaces 1-9, whereas the corresponding array indeces are 0-8).

  def input_to_index(user_input)
    user_input.to_i - 1
  end

# #move accepts as arguments the user's desired index for their move and the player's character of either "X" or "O."

  def move(index, currentletter = "X")
    @board[index] = currentletter
  end

# #position_taken? checks to see whether the space the user wants to play their move is already taken or not. Returns true if the position is indeed taken, or false if it is free.

  def position_taken?(board = nil, index)
    @board[index] != " " && @board[index] != ""
  end

# #valid_move? accepts an index. It returns true if the move is valid (present on the game board and not yet filled by another character) and false/nil if it is not.

  def valid_move?(board = nil, index)
    index.between?(0,8) && !position_taken?(@board, index)
  end

# #turn_count returns the number of turns already played.

  def turn_count(board = nil)
    counter = 0
    @board.each do |movemade|
      if movemade == "X" || movemade == "O"
      counter += 1
      end
    end
    return counter
  end

# #current_player determines whether it's "X"'s or "O"'s turn.

 def current_player
    turnnumber = turn_count
    turnnumber.even? ? "X" : "O"
  end

# #turn implements a full turn. It asks the user where they want to make their move, and if valid, it makes the move and displays the board. Else, it prompts the user for a new position until it receives a valid move.

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      letter = current_player
      move(index, letter)
      display_board
    else
        turn
  end

# #won? tests for whether or not the game has been won. If there is a win, it returns the winning character location indices. If no win has occured, it returns false/nil.

def won?
  WIN_COMBINATIONS.each do |wc|
    if ((@board[wc[0]] == "X") && 
      (@board[wc[1]] == "X") && 
      (@board[wc[2]] == "X")) ||
      ((@board[wc[0]] == "O") && 
      (@board[wc[1]] == "O") && 
      (@board[wc[2]] == "O"))
        return wc
    end
  end
  return false
end

# #full? returns true if the board is filled.

  def full?
    @board.all? do |place|
      (place== "X") || (place == "O")
    end
  end

# #draw? returns true if the board is full but has not been won. It returns false if the board is not yet full and no win has occured, or if the board has been won.

  def draw?
    if won?
      return false
    elsif full?
      return true
    end
  end

# #over? returns true if a win has occured, a draw has occured, or the board is full.

  def over?
    if won? || draw? || full?
      return true
    else
      return false
    end
  end

# #winner returns the winning character, given that the game has been won.

  def winner
    if won?
      winnerchar = won?
      return @board[winnerchar[0]]
    else
      return nil
    end
  end

# #play is responsible for the overall game loop. It activates turns while checking whether the game is over or not before ending the turns. When the game is in fact over, it then reports the game outcome.

  def play
    until over? == true
      turn
    end
    if over?
      if won?
        thewinner = winner
        puts "Congratulations #{thewinner}!"
      else
        puts "Cat's Game!"
      end
    end
  end
  end
  
end
