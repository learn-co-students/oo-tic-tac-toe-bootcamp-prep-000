class TicTacToe
  def initialize
    #must set the starting state of the board,
    #an array with 9 " " empty strings, within an instance variable named @board.
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    #constant set it equal to a nested array filled with the index values for the
    #various winning combinations
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    #prints the current board representation based on the @board instance
    #variable
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(player_move)
    #pass user input (in the form of a string, e.g., "1", "5", etc.)
    #and have it return to us the corresponding index of the @board array
    @index = player_move.to_i - 1
  end

  def move(index, player_token="X")
    #take in two arguments: the index in the @board array that the player
    #chooses and the player's token (either "X" or "O"). The second argument,
    #the player's token, should default to "X".
    @board[index] = player_token
    @board
  end

  def position_taken?(index)
    #evaluate the user's desired move against the Tic Tac Toe board and check
    #to see whether or not that position is already occupied.
    #If the position is free, the method returns false, true otherwise
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    #accepts a position to check and returns true if the move is valid and
    #false or nil if not.
    if position_taken?(index) == true
      false
    elsif !index.between?(0,8)
      false
    else
      true
    end
  end

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

  def turn_count
    #returns the number of turns that have been played based on the
    #@board variable
    counter = 0
    @board.each do |square|
      if square == "X" || square == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    #use the #turn_count method to determine if it is "X"'s or "O"'s turn.
    if turn_count % 2 == 0
      current = "X"
    else
      current = "O"
    end
  end

  def won?
    #returns false/nil if there is no win combination present in the board
    #and returns the winning combination indexes as an array if there is a win.
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      #return the win_combination indexes that won.
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    #return false or nil if there is no winning combination
    false
  end

  def full?
    #return true if every element in the board contains either an "X" or an "O".
    !@board.include? " "
  end

  def draw?
    #returns true if the board has not been won and is full
    if !won? && full?
      true
    #returns false if the board is won
    else
      false
    end
  end

  def over?
    #returns true if the board has been won or is full (i.e., is a draw).
    if won? || draw? || full?
      true
    end
  end

  def winner
    #Given a winning @board, #winner returns the token, "X" or "O", that
    #has won the game and calls won for the winning combination
    if winning_combo = won?
      #match winning combo against the board
      #winner = winning_combo[0]
      @board[winning_combo[0]]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
