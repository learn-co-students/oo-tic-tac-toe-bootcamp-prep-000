class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Diagonal 1 (negative slope)
    [2,4,6]  # Diagonal 2 (positive slope)
  ]
  
  def initialize
    @board = Array.new(9, " ")
    # It looks like I cannot define WIN_COMBINATIONS as an instance variable here.
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, player = "X")
    @board[index] = player
  end
  
  def position_taken? (index)
    @board[index] != " " && @board[index] != "" && @board[index] != nil
    # Or this: !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,9)
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
    
    # Another method:
    # index_array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    # index_array.count{|index| position_taken?(index)}
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
    #turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn
    puts "Please enter a number between 1 and 9:"
    input = gets.strip
    index = input_to_index(input)
  
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Sorry. Invalid move. Please try again."
      turn
    end
  end
  
  def won? # My TicTacToe.rb lab has a less elegant Solution.
    # However, the official solution may be even more elegant.
  
    # Find the first win combination matching these conditions:
    # 1. The token in the board space at the index "win_combination[0]"
    #    matches the token in the board space at the index "win_combination[1]".
    # 2. Same as condition 1, but with win_combination[1] and win_combination[2].
    # 3. All of the board positions corresponding to the win combination are filled;
    #    none of them are blank or nil.
    
    WIN_COMBINATIONS.find do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && 
          position_taken?(win_combination[2])
    end
    # Return nil if no win combination was found
  end
  
  def full?
    turn_count == 9 # 9 turns will fill up the whole board
    # @board.all?{|token| token == "X" || token == "O"} # works, too. So does this:
    # index_array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    # index_array.all?{|index| position_taken?(index)}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    # Technically, #draw isn't needed for this game AT ALL! I just need #won? and #full?
    # The reason: if the game is not won, and the board is full, it's a draw by definition! That said, won? || draw? is more understandable.
    # won? || full?
    won? || draw?
  end
  
  def winner
    # Returns "X", "O", or nil
  
    winning_player = won? # This is either nil, or it's a win combination.
  
    if winning_player
      @board[winning_player[0]]
      # winning_player[0] is the win combination's first index, 
      # corresponding to a position on the board.
      # This returns the winning token at that position.
    end
  end
  
  def play
    # Since the order of turns goes X, O, X, O, X
    # there won't be a winner until at least 5 turns have been played
    # 5.times do turn end
    # However, that causes an infinite loop in the tests since they don't provide 5 inputs.
  
    # This executes #turn 9 times maximum (or 4 times, if the code above is used) 
    until over?
      turn
    end
  
    # The board is full by now, so I don't need to check for that.
    # Also, the official solution has a more elegant if/else statement.
    case winner
    when "X"
      puts "Congratulations X!"
    when "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end