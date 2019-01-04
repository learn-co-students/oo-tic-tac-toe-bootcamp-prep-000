class TicTacToe

def initialize
	@board = Array.new(9, " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],
[0,4,8],[2,4,6]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def valid_move?(index)
	if @board[index] == "X"  || @board[index] == "O"
		return false			
	elsif index >= 0 && index <= 8
		return true
	elsif  index < 0 || index > 8
		return false
	else
			



	#elsif board[index] == " " || board[index] == "X"
			#return nil

		return false

		
	end
end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
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
	 def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end



def won?

WIN_COMBINATIONS.each do |win_combination|

	win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    
    
 	 
  position_1 = @board[win_index_1] 
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3] # load the value of the board at win_index_3
  
  
  

  			if 		position_1 == "X" && 
  					position_2 == "X" &&
  				    position_3 == "X" 
  				    
		  		 	
    	return win_combination
    	
    elsif           position_1 == "O" && 
  					position_2 == "O" &&
  				    position_3 == "O" 
    	  	  return win_combination 
    	  	  
    	  	else false
		end
	end
		
	
		if position_taken?(0)
			return false
		

		end
end

def full?
	if position_taken?(8)
	return true
else return false
	#else  return draw?(board)
		
	end
end


def draw?
	
 if !won? && full?
 	return true
 elsif !won? || !full?
 	return false
 else return nil
 	
 end

end

def over?
	if won?
	return true
elsif draw?
	return true
elsif full?
	return true
else return false
		
		
	end
end

def winner
  position = []
  position = won?
    if !won?
  	return nil
elsif @board[position[2]] == "X"
      return "X" 
     
  else return "O"
  
      	end
      	
	end


def input_to_index(user_input)
	actual_input = user_input.to_i - 1
end

def move(actual_input, typedin)
 
 	@board[actual_input] = typedin

 end


	 def turn
 			
display_board
 			puts "Please enter 1-9:"
 			
 			#move(board, actual_input, typedin)
			user_input = gets.chomp
 		 actual_input = input_to_index(user_input)
 		 

 		
	if valid_move?(actual_input) && current_player == "X"
			return @board[actual_input] = "X"
			
		elsif valid_move?(actual_input) && current_player == "O"
		 	 return @board[actual_input] = "O"
		 	 
		 	else return  user_input = gets.chomp
		 puts "Please enter 1-9:"
		 
		
		end
		
	end


def turn_count
	turns = 0
	
@board.each do |occupied|
	
				if occupied == "X" || occupied == "O"
					 turns += 1
			
				end
			end
    return turns
end


def current_player
turns = turn_count
if turns % 2 == 0
	return "X"
else
	return "O"
end
end
 

 def play

while draw? == true && full?
 	return   puts "Cat's Game!"
	 end
until over? == true 
		
turn

	end

if won?  && (winner == "X"|| winner == "O")
	return puts "Congratulations #{winner}!"

end
end


end