class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end


  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    return user_input.to_i - 1
  end

  def move( index, char  )
    @board[index] = char



  end

  def position_taken?( index)

  if @board[index] == "" || @board[index] == " " || @board[index] == nil
    return false
  elsif @board[index] == "X" || @board[index] == "O"
    return true
  end
  end

  def valid_move?( index)
    # if the index is between 0 and 8 and the position is not taken, return true
    if index.between?(0, 8) && !position_taken?(index)
      return true
      # otherwise return false
    else
      return false
    end
  end

  def turn

    puts "Please enter 1-9:"
    input = gets.strip # will return a string
    index = input_to_index(input) # input is the data being passed to user_input
    if valid_move?( index)
      move( index,  current_player)

      display_board
    else
      puts "Invalid move"
      display_board
      turn
    end

  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}

  end

  def current_player
   turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
  WIN_COMBINATIONS.any? do |combo|

    if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"

        return combo
    elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
      return combo
    else false
  end
    end
  end

  def full?
    @board.all? do |taken|
    taken != " "
  end
  end

  def draw?
   !won? && full? == true
  end

  def over?
    won? || draw?
  end

  def winner
  if won?
  won?.all? do |wins|
    if @board[wins] == "X"
      return "X"
    elsif  @board[wins] == "O"
      return "O"
    else
    end
  end
  end
  end

  def play
  until over?
    turn
  end
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  elsif draw? == true
    puts "Cat's Game!"
  else
  end
end
end
