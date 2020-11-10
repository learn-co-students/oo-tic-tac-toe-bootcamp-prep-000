class TicTacToe     # creates class for TicTacToe
  def initialize      # creates #initialize
    @board = Array.new(9, " ")      # assigns new empty array @board variable
  end


  WIN_COMBINATIONS = [      # creates a constand WIN_COMBINATIONS and assigns array of winning combinations
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]


  def display_board     # creates #display_board and prints current board based on @board array
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(input)     # creates #input_to_index that takes user input
    index = input.to_i - 1      # changes string to integer and subtracts 1 to make zero indexed
  end


  def move(index, tolken = "X")     # creates #move that takes index in the @board array and players tolken (default is "X")
    @board[index] = tolken      # logs move
  end


  def position_taken?(index)      # creates #position_taken?
  @board[index] == "X" || @board[index] == "O" ? true : false     # if position has "X" or "O" => true : false
  end


  def valid_move?(position)     # creates #valid_move? and takes a position
    position_taken?(position) == false && position.between?(0, 8) ? true : false      # if position is not taken and between 0 - 8 ? true : false
  end


  def turn      # creates #turn to include protical for one full move
    puts "Please enter spot 1-9"             # asks user for move between 1 - 9
    user_input = gets.chomp                  # Receives input
    user_index = input_to_index(user_input)  # Translate input into index value
    if valid_move?(user_index) == true       # If move valid, make move, display board
      move(user_index, current_player)
      display_board
    else                                     # if move invalid ? run turn again until valid_move
      turn
    end
  end


  def turn_count      # creates #turn_count
    count = 0     # sets counter
    @board.each do | space |      # loops through each element in @board array
      if space != " "     # if it is not empty add one to the counter
        count += 1
      end
    end
    return count      # return the count

  end


  def current_player      # creats current_player method
    turn_count % 2 == 0 ? "X" : "O"     # uses turn_count to see if "X" or "O" turn
  end


  def won?      # creates #won?
    WIN_COMBINATIONS.any? do | combo |      # loops through WIN_COMBINATIONS array
      position_1 = @board[combo[0]]     # assigns each array to a position variable
      position_2 = @board[combo[1]]
      position_3 = @board[combo[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"     # check if all are "X" or "O"
        return combo      # if so => wining combo
      end
    end
  end


  def full?     # creates #full?
    @board.all? do | spot |     # check if all on board are "X" or "O"
      spot == "X" || spot == "O"
    end
  end


  def draw?     # creates #draw?
    full? == true && won? == false      # checks if board is full and no winning combo has occured
  end


  def over?     # creates #over?
    draw? == true || won? != false      # checks if there was a win or draw
  end

  def winner
    if won? != false    # checks if win has occured
      winner_winner = won?      # create variable to hold winning array
      return @board[winner_winner[0]]     #return what is in one of the arrays
    end
  end


  def play      # creates #play (the main function)
    until over? == true     # until game is over
      turn      # take turns
    end
    if won? != false      # if there is a win congratulates winner
      puts "Congratulations #{winner}!"
    elsif draw? == true     # if draw => alerts it is a cat's game
      puts "Cat's Game!"
    end    
  end
end
