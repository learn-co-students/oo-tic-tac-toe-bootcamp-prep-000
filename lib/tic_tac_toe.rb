class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    @index = input.to_i - 1
    return @index
  end
  
  def move(index, chrct)
    return @board[index] = chrct
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    position = index + 1
    if !position_taken?(index) && position.between?(1, 9)
      return true
    else
      return false
    end
  end
    
  def turn
    puts "Please enter 1-9:"
    numb = gets.strip
    numb2 = input_to_index(numb)
    if valid_move?(numb2)
      move(numb2, current_player())
      display_board()
    else
      turn()
    end
  end

  def turn_count
    count = 0
    @board.each { |chrt|
      if chrt == "X" || chrt == "O"
        count += 1
      end
    }
    return count
  end
 
  def current_player
    turn_count() % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.detect {|combination|

	  if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
	    return combination
	  elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
    	return combination
	  else
	    false
	  end
		  }
  end

  def full?
    if @board.detect {|index|
      index == nil || index == " "}
      return false
    else
      return true
    end
  end

  def draw?
    if !won?() && full?()
      return true
    else
    return false
    end
  end

  def over?
    if won?() || full?() || draw?()
      return true
    end
  end

  def winner
    WIN_COMBINATIONS.detect {|combination|
	    if @board[combination[0]] == "X" && @board[combination[1]] == "X" && @board[combination[2]] == "X"
	      return "X"
	    elsif @board[combination[0]] == "O" && @board[combination[1]] == "O" && @board[combination[2]] == "O"
	      return "O"
	    else
	      nil
	    end
		 }
  end


  def play
    while !over?()
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end
  
  def play
    while !over?()
      turn()
    end
    if won?()
     puts "Congratulations #{winner()}!"
   else
    puts "Cat's Game!"
   end
  end
  
end