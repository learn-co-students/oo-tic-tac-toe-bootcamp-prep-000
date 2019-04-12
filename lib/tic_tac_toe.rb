class TicTacToe
	def initialize(board = nil)
		@board = board || Array.new(9, " ")
	end

	WIN_COMBINATIONS = [
	[0, 1, 2],
	[3, 4, 5],
	[6, 7, 8],
	[0, 3, 6],
	[1, 4, 7],
	[2, 5, 8],
	[0, 4, 8],
	[2, 4, 6]
]

	def display_board
	  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
	  puts "-----------"
	  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
	  puts "-----------"
	  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def input_to_index(input)
	 	inp = nil
	 	if input.kind_of?(Array)
	 		inp = input.join.to_i
	 	else 
	 		inp = input.to_i
	 	end
	 	return inp - 1
 	end

	def move(index, char = "X")
		@board[index] = char
	end

	def position_taken?(index)
		if @board[index] == "" || @board[index] == " " || @board[index].nil?
			return false
		else @board[index] == "X" || @board[index] == "O"
			return true
		end
	end

	def valid_move?(index)
		if !position_taken?(index) && index.between?(0, 8)
				true
		else
			false
		end
	end

	def turn
		puts "Please enter 1-9:"
		input = gets.split
		index = input_to_index(input)
		if valid_move?(index)
			move(index, current_player)
			display_board
		else
			puts "invalid"
			new_input = gets.split
		end
	end

	def turn_count
		counter = 0
		@board.each do |space|
			if space == "X" || space == "O"
				counter += 1
			end
		end
		counter
	end

	def current_player
		turn_count % 2 == 0 ? "X" : "O"
	end

	def won?
		WIN_COMBINATIONS.each do |combo|
			arr = []
			for i in combo
				arr.push(@board[i])
				if arr == ["X","X","X"] || arr == ["O","O","O"]
					return combo
				end
			end
		end
		return false
	end

	def full?
		for i in @board
			if i == " " || i == ""
				return false
			end
		end
		true
	end

	def draw?
		if !won? && full?
			return true
		end
		false
	end

	def over?
		if full? || won? || draw?
			return true
		end
		return false
	end

	def winner
		combo = won?
		if won?
			for i in combo
				return @board[i]
			end
		end
	end

	def play
  	counter = 0
  	until counter == 9 || over?
    	turn
    	counter += 1
    	end
    	if over? && won?
    		puts "Congratulations #{winner}!"
    	end
    	if over? && draw?
    		puts "Cat's Game!"
    	end
  	end


 end
