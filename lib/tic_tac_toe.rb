class TicTacToe
  #initialize a fresh board on each new instance
  def initialize(board = Array.new(9," "))
    @board = board
  end
  
  #list of winning combinations
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

  #code to disaply the board
  def display_board
  divider = "-" *11
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts divider
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts divider
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  #code to convert an input to an index
  def input_to_index(input)
    return input.to_i - 1
  end

  #code to check if a position is taken
  def position_taken?(pos)
  #true if space is empty and false if filled
    if @board[pos] == " "
      return false
    else
      return true
    end
  end
  #important to note that position_taken? will either return true or false

  #code for move method
  def move(position,player_letter = "X")
    #input logic here
    @board[position] = player_letter
  end

  #code to check if something is a valid move
  # code your #valid_move? method here
  def valid_move?(index)
    if (index>=0 && index<9) && !position_taken?(index)
      return true
    end
  end
  
  #code for turn method
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    user_move = input_to_index(user_input)
  
    if valid_move?(user_move)
      move(user_move,current_player)
      display_board
    else
      turn
    end
  end

  #code for counting the number of player turns
  def turn_count
    turns_so_far = 0
    @board.each do |arr_item|
      if arr_item == "X" || arr_item =="O"
        turns_so_far += 1
      end
    end
    return turns_so_far
  end

  #code to check to see who is the current player
  def current_player
    if turn_count % 2 != 0
      return "O"
    else
      return "X"
    end
  end

  #code to check to see if a player has won the game
 # Define won?, full?, draw?, over?, and winner below
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " "
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
end

  def winner
    winning_combo = won?
    if winning_combo
      @board[winning_combo[0]]
    end
  end


#code for play method
def play
  turn until over?
  
  if won?
    puts "Congratulations #{winner}!"
    
  else
    puts "Cat's Game!"
  end
end

end
