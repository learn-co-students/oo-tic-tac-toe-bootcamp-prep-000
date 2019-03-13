class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # Row wins
    [3, 4, 5], 
    [6, 7, 8], 
    [0, 3, 6], # Column wins
    [1, 4, 7], 
    [2, 5, 8], 
    [0, 4, 8], # Diagonal wins 
    [2, 4, 6] 
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  #
  # Prints the tic-tac-toe board to stdout
  #
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  #
  # Converts the user input string to an integer and normalizes to zero-index 
  #
  # @param <user_input> - string containing user input
  def input_to_index(user_input)
    return user_input.to_i() - 1
  end
  
  #
  # Enters the specified <player> into the specified position on the board.
  #
  # @param <move_position> - index of next move, should be in range 0-8
  # @param <player> - string with value "X" or "O"
  #
  def move(move_position, player="X")
    @board[move_position] = player
  end
  
  #
  # Determines whether the specified index represents a valid position on the game board
  #
  def position_taken?(index)
    position = @board[index]
    
    if !(position.nil? || position.eql?(" ") || position.empty?)
      return (position.eql?("X") || position.eql?("O"))
    else
      return false
    end
  end
  
  #
  # Returns true if <index> is a valid position
  #
  # @param <index> - an integer representing a position on the game board
  #
  def valid_move?(index)
    return index.between?(0, @board.length) && !position_taken?(index)
  end
  
  #
  # Returns true if <index> is a valid position
  #
  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end
  
  #
  # Returns the number of turns taken in the current game
  #
  def turn_count()
    turns = 0
    
    @board.each do |position|
      if position.eql?("X") || position.eql?("O")
        turns += 1
      end
    end
    
    return turns
  end 
  
  #
  # Returns the current player (next to make a move)
  #
  def current_player()
    # Assume player X goes first
    return turn_count() % 2 == 0 ? "X" : "O"
  end
  
  def won?()
    WIN_COMBINATIONS.each do |winc|
      if (@board[winc[0]].eql?("X") && @board[winc[1]].eql?("X") && @board[winc[2]].eql?("X")) || (@board[winc[0]].eql?("O") && @board[winc[1]].eql?("O") && @board[winc[2]].eql?("O"))
        return winc
      end
    end
    return false
  end 
  
  def full?()
    @board.all? do |position|
      !(position.nil? || position == " ")
    end
  end
  
  def draw?()
    !won?() && full?()
  end
  
  def over?()
    won?() || draw?()
  end
  
  def winner()
    win_combo = won?()
    win_combo ? @board[win_combo[0]] : nil
  end
  
  # Define your play method below
  def play()
    
    while !over?()
      turn()
    end
    
    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end
  
end # End TicTacToe class