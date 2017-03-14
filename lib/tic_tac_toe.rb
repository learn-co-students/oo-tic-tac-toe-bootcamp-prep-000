class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
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

  def input_to_index( user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?( index)
  end


  def turn

    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?( index)
      move( index, current_player )
      display_board
    else
      turn
    end

  end

  def won?
    # Return indexes if there is a win, otherwise nil
    WIN_COMBINATIONS.each do |win_combination|
      # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
      # grab each index from the win_combination that composes a win.
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      #puts "Checking Indexes: #{win_combination[0]}, #{win_combination[1]}, #{win_combination[2]}!"
      #puts "Values: #{position_1}, #{position_2}, #{position_3}!"
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
         (position_1 == "O" && position_2 == "O" && position_3 == "O")
         #puts "Winning Indexes: #{win_combination[0]}, #{win_combination[1]}, #{win_combination[2]}!"
         return win_combination
      end

    end  # do end

    return false  # No winning combinations

  end  # end won?


  def full?
#    return !board.detect{|i| i==" "}
    !@board.include?(" ")
  end

  def draw?

    # draw? expects false from won? however winner? expexcts nil
    playerWon = won?
    if playerWon == nil
      playerWon = false
    end

    boardFull = full?

      if (playerWon == false) && (boardFull == true)
        true
      elsif (playerWon == false) && (boardFull == false)
        false
      elsif playerWon == true
        false
      else
        false
      end

  end  # end of draw?

  def over?

    if won? || draw? || full?
      return true
    else
      return false
    end

  end

  def winner

      myWinner = won?

      if myWinner != false
        return @board[myWinner[0]]
      else
        return nil
      end

  end

  def play

      until over?
        turn
      end

      if winner != nil
        puts "Congratulations #{winner}!"
      end

      if draw?
        puts "Cat's Game!"
      end

  end  # End of play

end  #  end of class TicTacToe
