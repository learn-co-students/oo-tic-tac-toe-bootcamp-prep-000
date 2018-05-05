class TicTacToe
<<<<<<< HEAD
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
	
	def initialize
		@board = Array.new(9, ' ')
	end

	def display_board
		puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
		puts "-----------"
		puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
		puts "-----------"
		puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
	end

	def input_to_index(input)
		input.to_i - 1
	end

	def move(index, current_player)
		@board[index] = current_player
	end

	def position_taken?(location)
		@board[location] != " " && @board[location] != ""
	end

	def valid_move?(index)
		index.between?(0, 8) && !self.position_taken?(index)
	end

	def turn_count
		@board.reduce(0) { |sum, piece| sum += (piece == 'X' || piece == 'O') && 1 || 0 }
	end

	def current_player
		self.turn_count % 2 == 0 ? 'X' : 'O'
	end

	def turn
		puts "Please enter 1-9:"
		input = gets.strip
		index = self.input_to_index(input)
		if self.valid_move?(index)
			self.move(index, self.current_player)
			self.display_board
		else
			self.turn
		end
	end

	def won?
		won = WIN_COMBINATIONS.find do |combo|
			pieces = combo.map { |pos| @board[pos] }
			pieces.uniq.length == 1 && self.position_taken?(combo[0])
		end
	end

	def full?
		@board.all? { |piece| piece == 'X' || piece == 'O' }
	end

	def draw?
		!self.won? && self.full?
	end

	def over?
		self.full? || self.won?
	end

	def winner
		won = self.won?
		won.nil? ? nil : @board[won[0]]
	end

	def play
		until self.over?
			self.turn
			if self.draw?
				break
			end
		end
		
		if self.won?
			puts "Congratulations #{self.winner}!"
		elsif self.draw?
			puts "Cat's Game!"
		end
	end
=======
  
>>>>>>> 7f30bd8804aeac4a1eceb1140753ea156f9806d0
end