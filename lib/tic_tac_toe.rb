class TicTacToe
	def initialize
		@board = [" "," "," "," "," "," "," "," "," "]
	end

	WIN_COMBINATIONS = [
		#win horizontally
		[0,1,2],
		[3,4,5],
		[6,7,8],
		#win vertically
		[0,3,6],
		[1,4,7],
		[2,5,8],
		#win diagonally
		[0,4,8],
		[2,4,6]
	]

	def display_board
	puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	puts "-----------"
	puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	puts "-----------"
	puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def move(index, sign)
		index = input_to_index(index)
		@board[index] = sign
	end

	def position_taken?(index)
		@board[index] == "X" || @board[index] == "O"
	end

	def input_to_index(input)
		input.to_i - 1
	end

	def valid_move?(index)
		return false if index.to_i.to_s != index
		index = input_to_index(index)
		!position_taken?(index)
	end

	def turn
		puts "Put a number 1-9"
		index = gets.strip
		if valid_move?(index)
			move(index, current_player)
		else
			turn
		end
		display_board
	end

	def current_player
		turn_count % 2 == 0? "X" : "O"
	end

	def turn_count
		count = 0
		@board.each {|e| count += 1 if e != " "}
		count
	end

	def won?
		WIN_COMBINATIONS.each do |combo|
			return combo if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
			return combo if @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
		end
		false
	end

	def full?
		!@board.include?(" ")
	end

	def draw?
		full? && !won?
	end

	def over?
		won? || draw?
	end

	def winner
		return @board[won?[0]] if won?
		nil
	end

	def play
	   while !over?
		     turn
	   end
	   puts "Cats Game!" if draw?
	   puts "Congratulations #{winner}!" if won?
	end
end
