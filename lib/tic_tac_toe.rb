class TicTacToe

  # initialize instance with empty board
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
    puts "Welcome to Tic Tac Toe!"

    display_board
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # First column
    [1,4,7], # Second column
    [2,5,8], # Third column
    [0,4,8], # LR diagonal
    [2,4,6]  # RL diagonal
  ]

  # Define display_board that accepts a board and prints
  # out the current state.
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # Converts the user input to the board index
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  # Places user's token in chosen board position
  def move(position, token = "X")
    @board[position] = token
  end

  # Determines chosen position on the board is already taken
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # Determines if the chosen move is valid
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  # makes a valid move or asks for a input if position is invalid
  def turn
    token = current_player
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, token)
      display_board
    else
      puts "Invalid move"
      turn
    end
  end

  # counts number occupied positions on the board
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # Determines if the game has been won
  def won?
  won = false
    WIN_COMBINATIONS.detect do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] && @board[win_combo[0]] == @board[win_combo[2]] && position_taken?(win_combo[0])
    end
  end

  # Determines if they board is full
  def full?
    @board.all? do |token|
      token == "X" || token == "O"
    end
  end

  # Determines if the game was a draw
  def draw?
    !won? && full?
  end

  # determines if the game is over
  def over?
    full? || won? || draw?
  end

  # Returns value of winning token
  def winner
    if !won?
      return nil
    elsif @board[won?[0]] == "X"
      return "X"
    elsif @board[won?[0]] == "O"
      return "O"
    end
  end

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
