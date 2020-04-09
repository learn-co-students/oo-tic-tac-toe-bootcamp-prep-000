class TicTacToe
  def initialize
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  WIN_COMBINATIONS = [
    # Row Wins
    [0, 1, 2],  # Top row
    [3, 4, 5],  # Middle row
    [6, 7, 8],  # Bottom Row
  
    # Column Wins
    [0, 3, 6],  # First Column
    [1, 4, 7],  # Second Column
    [2, 5, 8],  # Third Column
  
    # Diagonal Wins
    [0, 4, 8],  # Top Left to Bottom Right
    [2, 4, 6]   # Top Right to Bottom Left
  ]

  # Displays the values of board array
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Converts User input for Use in arrays
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end

  # Place x or o based on input
  def move(index, token = 'X')
    @board[index] = token
  end

  # Checks "if" the index in the array is occupied
  def position_taken?(index)
    if @board[index] == 'O' || @board[index] == 'X'
      true
    elsif @board[index] == ' '
      false
    end
  end
  
  # Checks if the index is within range of 0-8 and has either O or X
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  # Asks for input, gets, then converts
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
  
  # Sets a counter for turn number
  def turn_count
    i = 0
    @board.each do |x|
      i += 1 if x == 'X' || x == 'O'
    end
    i
  end
  
  # Sets Current Player, X/O
  def current_player
    turn = turn_count.even? ? "X" : "O"
  end
  
  # Checks if a player won the game
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == 'X' && position_2 == 'X' && position_3 == 'X'
        return win_combination # return the win_combination indexes that won.
      elsif position_1 == 'O' && position_2 == 'O' && position_3 == 'O'
        return win_combination # return the win_combination indexes that won.
      end
    end
    return false # If you leave in the do loop above, it forces a false return.
  end
  
  # Checks if given board array is full
  def full?
    counter = 0
    @board.each do |i|
      if i == 'X' || i == 'O'
        counter += 1
      else
        return false
      end
    end
    if counter == 9
      return true
    end
  end
  
  # Checks if there is a draw
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  # Checks if the game is over
  def over?
    if draw? || full? || won?
      true
    else
      false
    end
  end
  
  # Checks who the winner is
  def winner
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return 'X' # returns the Token that won.
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return 'O' # returns the Token that won.
      end
    end
    return nil
  end
  
  # Plays game
  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

