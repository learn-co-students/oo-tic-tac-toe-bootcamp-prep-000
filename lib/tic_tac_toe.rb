class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Last row
    [0,3,6], # First Vertical Row
    [1,4,7], # Second Vertical Row
    [2,5,8], # Third Vertical Row
    [0,4,8], # \ Diagonal
    [2,4,6], # / Diagonal
  ]
  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   	puts "-----------"
   	puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   	puts "-----------"
   	puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(location, current_player = "X")
    @board[location] = current_player
  end

  def position_taken?(location)
    if(@board[location] == " " || @board[location] == "" || @board[location] == nil)
      return false
    elsif(@board[location] == "X" || @board[location] == "O" )
      return true
    end
  end

  def valid_move?(location)
      if(location.between?(0, 8) && !(position_taken?(location)))
        return true
      else
        return false
      end
  end

  def turn_count()
    @board.count do |element| 
      element == "X" || element == "O"
    end
  end

  def current_player()
    (turn_count().even?) ? "X": "O"
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if(valid_move?(index))
      move(index, current_player())
      display_board()
    else
      turn()
    end
  end

  def won?()
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      !!(position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
  end

  def full?()
    @board.all? do |element|
      element == "X" || element == "O"
    end
  end

  def draw?()
    !won?() && full?()
  end

  def over?()
    !!(won?() || full?() || draw?())
  end

  def winner()
    !!won?() ? @board[won?()[0]]: won?()  # where won?()[0] -> win_combination_array[0]
  end

  def play()
    until over?() do
      turn()
    end
    if(!!winner())
      puts "Congratulations #{winner()}!"
    elsif(draw?())
      puts "Cat's Game!"
    end
  end

end