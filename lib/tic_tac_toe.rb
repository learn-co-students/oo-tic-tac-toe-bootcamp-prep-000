class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

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

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      value = current_player
      move(index, value)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |element|
      if (element == "X" || element == "O")
         counter += 1
      end
    end
    counter
  end

  def current_player
    counter = turn_count
    if (counter%2 == 0)
       "X"
    elsif (counter%2 != 0)
       "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do|win_combination|
        if ((@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"))
          return win_combination
        end
    end
    return false
  end

  def full?
    @board.detect do |element|
      if (element == " " || element == "")
        return false
      end
    end
    true
  end

  def draw?
    full? && !won?
    # if (!won?(board) && full?(board))
    #   return true
    # elsif (!won?(board) && !full?(board)) || won?(board)
    #   false
    # end
  end

  def over?
    if (won? || draw? || full?)
      return true
    else
      false
    end
  end

  def winner
    WIN_COMBINATIONS.each do|win_combination|
      if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X")
        return "X"
      elsif (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")
        return "O"
      end
    end
    nil
  end

  # Define your play method below
  def play
    #i = 0
    #while i < 9
      #turn(board)
      #i += 1
    #end

    until over?
      turn
    end

    if (won?)
      puts "Congratulations #{winner}!"
    elsif (draw?)
      puts "Cat's Game!"
    end
  end

end
