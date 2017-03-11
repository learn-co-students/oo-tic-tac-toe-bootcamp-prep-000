class TicTacToe
  def initialize(board = Array.new(9," ") )
    @board = board
  end

  WIN_COMBINATIONS =
     [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]

    def display_board
      # whatever is placed into the array, the index of board will output the index into the space assigned.
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(input)
      #changes the input of 1 through 9 to 0 ythrough 8 to match array index
      input.to_i - 1
    end
     # creates the move of the player and place the character in the chosen spot
    def move(index, token)
      @board[index] = token
    end

    def position_taken?(index)
      @board[index] !=" "
    end

    def valid_move?(index)
# if the index is between 0 and 8 it is a vaild index
# if there is nothing in the place in the board make the first condition of 'position_taken?' true(other words the position is not taken)
    index.between?(0,8) && !position_taken?(index)

    end

    def turn_count
    @board.count{|square| square != " " }
  end


    def current_player
      turn_count.even? ? "X" : "O"
    end


    def turn
      puts "Please enter 1-9:"
      #grab input
      user_input = gets.strip
      # use input_to_index method to change the inputted number to an index number

      index = input_to_index(user_input)

      # if the move is valid using the valid_move? method
      if valid_move?(index)
        #place the move in the board
        token = current_player
        #display the board with the updated move
        move(index, token)
      else
        # if the input is not valid, ask to enter 1-9 again
          turn
        end
        display_board
    end


    def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end


    def full?
      # if board does not include empty string the board is full
      !@board.include?(" ")
    end

    def draw?
      #if the board is not won, and the board is full, its a draw
    !won? && full?
    end

    def over?
      #If the board is won or the board is draw the game is over
      won?|| draw?
    end



    def winner
      if combo = won?
        @board[combo[0]]
    end
  end

    def play
      turn until over?
      puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
      end
end
