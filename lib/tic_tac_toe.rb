class TicTacToe

  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Diagonal 1
    [2,4,6], # Diagonal 2
  ]

  def display_board#(board) -- NOTE WHAT YOU ARE DOING HERE -- REMOVING THE ARGUMENT AND
                    # REPLACING THE ARGUMENT WITH THE INITALIZED VARIABLE
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token) #removed board argument
    @board[index] = token
  end

  def position_taken?(location) #removed board argument
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index) #removed board argument
    index.between?(0,8) && !position_taken?(index) #conformed with now one arg in position_taken
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
     turn_count % 2 == 0 ? "X" : "O"
  end

  def turn #have to go through and remove board as an argument
      puts "Please enter 1-9:"
      z =  gets.chomp.to_i
      index = input_to_index(z)
      if valid_move?(index)
        token = current_player
        move(index, token)
      else
        turn
      end
    display_board
  end

  def check_winners
    WIN_COMBINATIONS.each do |winning_array|
      new_array = [ ] #placement is very important.  Did not work where this was outside the WIN_COMBINATIONS each do
      winning_array.each do |index|
        new_array << @board[index]
      end
      if new_array == ["X", "X", "X"] || new_array == ["O", "O", "O"]
        return winning_array # note the return is telling the whole method to stop! Distinguish this from break!
      end
    end
    return false # this is what got a return of false on a draw
  end

  def won?
    board_empty = @board.all? do |space|
      space == " "
    end
    if board_empty == true
      return false #return false
    else
      check_winners
    end
  end

  def full?
    board_full = @board.all? do |space|
      space != " "
    end
    if board_full == true
      true
    else
      false
    end
  end

  def draw?
    any_winner = won?
    board_full = full?
    if any_winner != false && board_full == true
        false
    elsif board_full == false
      false
    else
      true
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    if won? != false
      winny = won?
      @board[winny[0]]
    end
  end

  def play
    if over? == false
      loop do
        turn
        if over?
          break
        end
      end
    end
    if draw?
      puts "Cat's Game!"
      return
    else
      puts "Congratulations #{winner}!"
      return
    end
  end


end
