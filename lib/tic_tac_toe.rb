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


	def valid_move?(index)
	  index.between?(0,8) && !position_taken?(index)
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


	def input_to_index(inp)
	  s = inp.to_i
    s - 1
	end


	def turn
	  puts "Please enter 1-9: "
	  inp = gets.strip
	  index = input_to_index(inp)
	  if valid_move?(index)
	    move(index, current_player)
	  else !valid_move?(index)
      until valid_move?(index)
        puts "Sorry, invalid move. Please enter 1-9: "
        display_board
        inp = gets.strip
        index = input_to_index(inp)
        valid_move?(index)
  	    move(index, current_player)
      end
	  end
	end


	def position_taken?(index)
	  !(@board[index].nil? || @board[index] == " ")
	end


	def current_player
	  if turn_count % 2 == 0
      current_player = "X"
    else
      current_player = "O"
    end
	end


	def turn_count
    count = 0
	  @board.each do |move|
      if move == "X" || move == "O"
        count += 1
      end
    end
	end


	def move(index, player)
	  @board[index] = player
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
