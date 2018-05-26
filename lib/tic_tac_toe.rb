class TicTacToe 
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]
    
  # define board displaying method
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  # turn user input as board corresponding index
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  # put user input in the board array
  def move(index, player_token = "X")
    @board[index] = player_token
  end
  
  # check if given user move is taken
  def position_taken?(index)
  !(@board[index] ==  " " || @board[index] == nil)
  end
  
  # check if give user input position is untaken and between 0-8 
  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end
  
  # return turns that have been played
  def turn_count
    @board.count {|x| x == "X" || x == "O" }
  end
  
  # return current player regarding turn count
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  # get the user input position and check if valid, reask if not
  def turn 
    puts "Enter your position (1-9):"
    user_input = gets.strip
    index = input_to_index(user_input)
    valid_move?(index) ? move(index, value = current_player) && display_board : turn
  end
  
  # check if won move has been made
  def won?
    WIN_COMBINATIONS.find { |win| @board[win[0]] == @board[win[1]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])}
  end
  
  # check if board is full
  def full?
    return @board.all? { |value| value == "X" || value == "O"}
  end
  
  # check if its a draw (no one won)
  def draw?
  !won? && full?
end
  
  # check if game is over no matter which way
  def over?
    won? || draw?
  end
  
  # give the winner value
  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end
  
  # main method of the tic tac toe application
  def play
    while !over? do
      turn
    end
    player = winner
    if player
      puts "Congratulations #{player}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end