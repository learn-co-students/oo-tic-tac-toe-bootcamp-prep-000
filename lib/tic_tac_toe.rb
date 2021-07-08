class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],# bottom row
    [0,3,6],#left column
    [1,4,7],#middle column
    [2,5,8],#right column
    [0,4,8], #cross
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(input, current_player="X")
    index = input.to_i - 1
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
   	num = index.to_i-1
     num.between?(0,8) && !position_taken?(num)
   end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input.to_i - 1
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
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
     WIN_COMBINATIONS.each do |win_index|
     	 x_match = 0
  	   o_match = 0
    	for pos in win_index
    		if @board[pos] == "X"
    			x_match += 1
    			if x_match == 3
    				return win_index
    			end
  		elsif @board[pos] == "O"
    			o_match += 1
    			if o_match == 3
    				return win_index
  			end
  		else
  			break;
  		end
    	end
    end
  	return false
  end

  def full?
    @board.none? do |el|
      el == " " || el == "   "
    end
  end

  def draw?
    if won? == false && full? == true
        return true
    elsif full? == false
    	return false
  	else false
  end
  end

  def over?
    if won? != false || draw? == true
      return true
    else false
    end
  end

  def winner
  ind = won?
  if ind == false
    return nil
   end
  pos = ind[0]
  if @board[pos] == "X"
    return "X"
  else return "O"
  end
  end

  def play
    until over? == true
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
  end


end
