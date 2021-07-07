class TicTacToe
	def initialize(board = nil)
		@board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] || board
		display_board
	end

WIN_COMBINATIONS = [
[0,1,2],
[3,4,5],
[6,7,8],
[0,3,6],
[1,4,7],
[2,5,8],
[0,4,8],
[2,4,6]
]

def input_to_index(str)
  int = str.to_i
    if int == 0
      return -1
    end
  return int - 1
end

	def current_player
		if turn_count % 2 == 0
			return "X"
		end
			return "O"
	end

 	def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

	def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

def move(position, current_player)
  @board[position] = current_player
  @board
end

def position_taken?(index)
  if @board[index] == " "
    return false
  elsif @board[index] == ""
    return false
  elsif @board[index] == nil
    return false
  else
    return true
  end
end

def turn
  puts " #Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
   if valid_move?(index)
   	move(index, current_player)
  	display_board
   else
      puts "invalid"
      turn
   end
end

def valid_move?(input)
  index = input 
  if index > 8 || index < 0
    return false
  end
position_taken?(index) == false
end

def full?
	@board.all? do |spot|
		spot.include?("X") == true || spot.include?("O") == true
	end
end

def play
	until over?
		turn
	end
	if won?
		# winner = winner
		puts "Congratulations #{winner}!"
	elsif draw?
		puts "Cat's Game!"
	end
end

def draw?
	if won?
		return false
	end
	if full?
		return true
	end
end

def over?
	if draw?
		return true
	end
	if won?
		return true
	end
	return false
end

def winner
	if over? == false
		return nil
	end
	WIN_COMBINATIONS.each do |combo|
		if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
		 	return "X"
		end
	end
	WIN_COMBINATIONS.each do |combo|
		if @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
		 	return "O"
		end
	end
end

def won?
	WIN_COMBINATIONS.each do |combo|
		if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
		 	return combo
		end
	end
		WIN_COMBINATIONS.each do |combo|
		if @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
		 	return combo
		end
	end
	return false 
end

end