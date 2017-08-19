class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  # Define display_board that accepts a board and prints
  # out the current state.
  def display_board
      puts " #{@board[0]} ""|"" #{@board[1]} ""|"" #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} ""|"" #{@board[4]} ""|"" #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} ""|"" #{@board[7]} ""|"" #{@board[8]} "
  end
  # converts a user input to an integer
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  # move
  def move(index, current_player)
    @board[index] = current_player
  end
  # returns true/false based on position in board
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  # returns true/false based on position
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  # makes valid moves, asks for input again after failed validation
  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
  end
  # counts occupied positions
  def turn_count
    count = 0
    @board.each do |element|
      if element == "X" || element == "O"
         count += 1
      end
    end
    count
  end
  # returns current player
  def current_player
    turn = turn_count
    if turn % 2 == 0
      "X"
    else
      "O"
    end
  end
  # returns false for a draw, true for a win
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1] # load the value of the board at win_index_1
        position_2 = @board[win_index_2] # load the value of the board at win_index_2
        position_3 = @board[win_index_3] # load the value of the board at win_index_3

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          win_combination # return the win_combination indexes that won.
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          win_combination # return the win_combination indexes that won.
        else
          false
        end
    end
  end
  # returns true for a draw, false for game in progress
  def full?
    if @board.detect {|i| i == " " || i == nil}
      false
    else
      true
    end
  end
  # calls won? and full?. returns true for a fraw
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  # true for a draw, true for a won game, false for game in progress
  def over?
    if won? || draw? || full?
      true
    end
  end
  # return X when X won, O when O won, nil for no winner
  def winner
    if win_combination = won?
       @board[win_combination.first]
    end
  end
  # play method
  def play
    until over?
       current_player
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     else
       puts "Cat's Game!"
     end
   end
end
