class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [6,4,2], # Diagonal left bottom to right Top
    [0,4,8]  # Diagonal left top to right bottom
  ]
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  # converts user input to board index
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end
  
   # adds players X or O to their chosen position
  def move(position, player_token="X")
    @board[position] = player_token
  end
  
  # check if board position is empty or filled
  def position_taken?(index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
  end
  
  # check if move is valid (within the board and not in a filled position)
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  ####
  # Process for one complete turn
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end
  
  # returns number of turns that have been played
  def turn_count
    @board.count{|position| position == "X" || position == "O"}
  end

  # returns current player who needs to make next move
  def current_player
    count = turn_count
    player = count.even? ? "X" : "O"
    return player
  end
  
  # returns combination of winning indexes. If no winner, returns nil
  def won?
    
    def winning_combo?(combination)
      combination.all? {|position| position == "X"} || combination.all? {|position| position == "O"}
    end
    
    WIN_COMBINATIONS.detect do |win_combination|
      # Get index for each winning combination
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      # Get board position at each winning index position
      # so we can compare
      board_position_1 = @board[win_index_1]
      board_position_2 = @board[win_index_2]
      board_position_3 = @board[win_index_3]
      
      board_combination = [board_position_1, board_position_2, board_position_3]
      
      winning_combo?(board_combination)
    end
  end
  
  # Return false if there are any empty spaces
  def full?
    board = @board
    !board.include?(" ")
  end
  
  # Check if the board is full, but there are no winners
  def draw?
    !won? && full?
  end
  
  # Check if game is over (won, full board, or a draw)
  def over?
    won? || full? || draw?
  end

  # returns if winner is "X" or "O"
  def winner
    if won?
      win_combination = won?
      
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      winning_positions = [@board[win_index_1], @board[win_index_2], @board[win_index_3]]
      
      if winning_positions.all? {|position| position == "X"}
        return "X"
      elsif winning_positions.all? {|position| position == "O"}
        return "O"
      end
    end
  end
  
  def play
    until over?
      turn
    end
   
    if won?
      winning_player = winner
      puts "Congratulations #{winning_player}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end