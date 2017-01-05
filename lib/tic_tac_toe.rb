class TicTacToe # all methods below are within class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ") # Creates an array with 9 elements filled with " "
  end # end of method #initialize


  def input_to_index(user_input) #this method converts the user_input into the 0-8 index, AKA the position on the board
    user_input = user_input.to_i # assign user_input to (user_input.to_i), which converts the user_input to an integer
    user_input = user_input-1 # assign user_input to (user_input-1), which substracts 1 from the user_input
    #the above line with the (user_input-1) also returns -1 for strings without integers
  end

  # Define your WIN_COMBINATIONS constant (note: constants start with capital letters)
  WIN_COMBINATIONS = [
    [0,1,2], # Top row across
    [3,4,5], # Middle row across
    [6,7,8], # Bottom row across
    [0,3,6], # left row down
    [1,4,7], # center row down
    [2,5,8], # right row down
    [0,4,8], # diagonal left to right corner
    [2,4,6], # diagonal right to left corner
  ]


  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def move(index, current_player) # "X" is the default value for the token parameter --- we don't want a default value here
    @board[index] = current_player # replace board[index] (the position on the board) with the token
  end #end of method


  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ") # position is NOT taken if @board[index] is 'nil' or " "
  end


## new way to write method below from learn.co instructor, but i like my less succinct way better:
  # def valid_move?(input) ## new way to write this from learn.co instructor:
  #   input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  # end


  def valid_move?(position)  ### changed from index to position - ER 2017

    if (position > 9) || (position < 0) #if index (position on board entered by user) is greater than 9 or less than 0, return false
      false
    elsif position_taken?(position) ###otherwise, if position on board is taken, return false
      false
    else position.between?(0, 8) ###finally, if the position isn't taken, and the index (position on board entered by user) is between 0 and 8, return true
      true
    end # end if...elsif statements
  end # end valid_move? method


  def turn
    puts "Please enter 1-9:"
    input = gets.strip # gets move from user
    index = input_to_index(input) # <<-- calls the input_to_index method, to convert the user_input into the 0-8 index, and assigns value of input_to_index(user_input) to local variable 'index'

    if valid_move?(index) # if valid_move? returns true, meaning we've validated the move...
      move(index, current_player) #...then we run the move method
      display_board #...and display the board
    else turn # if the user's move wasn't valid, we return this function again, from within the function
    end # end if...else statement
  end # end method


  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def won?
  #for each win_combination in WIN_COMBINATIONS
  WIN_COMBINATIONS.find do |win_combination| # find instead of each??
    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
    # grab each index from the win_combination that composes a win.

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = @board[win_index_1] # load the value of the board at win_index_1
    position_2 = @board[win_index_2] # load the value of the board at win_index_2
    position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        #puts win_combination # output win_combination so i can see what the hell is happening ## <<-- don't need this
        true # not 'return true', just 'true' -- find method looks for what evaluates to true and returns the element that caused the true evaluation
      else
        false # not 'return false', just 'false' -- see above note for 'true'
      end # end if...else statement
    end # end for-each-loop... AKA WIN_COMBINATIONS.each do |win_combination|
  end # end method


  def full?  ###### this method works, but this can be written more clearly <<<----
    @board.all? do |positions|
      #puts "The #{board.length} position is #{positions}"
    if positions == " "
      #puts "The board is NOT full, there are some empty spaces." <<--- don't need this
    #if board.all? { |obj| obj }
      false
    elsif (positions == "X") || (positions == "O")
    #elsif board.all?
      #puts "The board is full!" <<--- don't need this
      true
      end # end if...else statement
    end # end for each loop
  end # end full? method


  def draw?
    if !won? && !full? # if not won and board is not full
      #puts "The board is not full yet, so it can't be a draw." <<--- don't need this
      false # it is NOT a draw
    elsif !won? && full? # if not won and full board
      puts "The game is a draw. No one wins."
      true # it is a draw
    end # end if statement
  end # end method


  def winner
    if won?
      if @board[won?[0]] == "X"
        puts "Congratulations X!"
        return "X"
      elsif @board[won?[0]] == "O"
        puts "Congratulations O!"
        return "O"
      end # end if..else statement
    else !won?
      nil ###this nil is returned outside the if..elsif statement, which is inside the if won?board statement
    end # end if won?board statement
  end # end method


  def over?
    if draw?
      puts "Cats Game!"
      true
    elsif won?
      winner # call winner(board) method to congratulate X or O
      true
    else
      puts "The game is not over yet." ##<<--- don't need this
      false
    end # end if...elsif..else statement
  end # end method


  def play #play method initiates a simple until loop and calls #turn
    until over? # if over==true... AKA if the game is over after that last move...
      turn #calls turn method, until game is over
    end #...end until over?(board) loop
  end #end play(board) method

end # end class TicTacToe
