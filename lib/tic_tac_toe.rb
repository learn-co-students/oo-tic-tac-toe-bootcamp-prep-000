class TicTacToe 
  def initialize
    @board =[" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 
  
  WIN_COMBINATIONS =[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [6,4,2],
  [0,4,8]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "    
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
#convert user input to board index
def input_to_index(user_input)
  user_input.to_i - 1
end
 
#player's move 
def move(index, current_player)  
  @board[index] = current_player
end

#board index vacancy
def position_taken?(index)
  @board[index] != " "
end

def valid_move?(index)
  if index.between?(0,8)
    if !position_taken?(index)
      true 
    end
  end
end

def turn
  puts "Please enter 1-9:"  
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
      #move based on input 
      move(index, current_player)
      
      #display board after valid move 
      display_board
    else
      #ask for valid input 
      turn
    end
end

def turn_count
  @board.count {|token| token == "X" || token == "O"} 
end 

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end 

def won?
  WIN_COMBINATIONS.detect do |win_combination|
    @board[win_combination[0]] == @board[win_combination[1]] &&
    @board[win_combination[1]] == @board[win_combination[2]] &&
    position_taken?(win_combination[0])
  end
end 

def full?
  @board.all?{|token| token == "X" || token == "O"} 
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end 

def winner
  if win_combination = won?
    @board[win_combination.first]
  end 
end 

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
 

end 