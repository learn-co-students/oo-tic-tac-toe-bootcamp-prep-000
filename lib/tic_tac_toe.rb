class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ") || board
  end

  WIN_COMBINATIONS = [
  	  [0,1,2],
  	  [3,4,5],
  	  [6,7,8],
  	  [0,3,6],
  	  [1,4,7],
  	  [2,5,8],
  	  [0,4,8],
  	  [6,4,2]
  	]

  def play
  	  while !over?
  	    turn
  	  end
  	  if won?
  	    puts "Congratulations #{winner}!"
  	  elsif draw?
  	    puts "Cat's Game!"
  	  end
  end


  def display_board
  	 puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  	 puts "-----------"
  	 puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  	 puts "-----------"
  	 puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def won?
  	 WIN_COMBINATIONS.find do |combo|
  	   @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && position_taken?(combo[1])
  	 end
  end


  def full?
    @board.none? do |i|
      i == " " || i.nil?
    end
  end

  def draw?
  	 won? == nil && full? == true
  end


  def over?
  	 won? != nil || draw? == true
  end


  def input_to_index(input)
    return input.to_i - 1
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    else
      return nil
    end
  end

  def turn
  	puts "Please enter 1-9: "
  	input = gets.strip
  	index = input_to_index(input)
  	if valid_move?(index) == true
      move(index, current_player)
    else
      until valid_move?(index)
        puts "Please enter 1-9: "
      	input = gets.strip
      	index = input_to_index(input)
      end
    end
  end


  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end


  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  def move(index, current_player)
  	 @board[index] = current_player
      # turn_count
      # display_board
  end


  def winner
  	 if won? != nil
  	   winner = @board[won?[0]]
  	 end
  end

end

ttt = TicTacToe.new
ttt.play
