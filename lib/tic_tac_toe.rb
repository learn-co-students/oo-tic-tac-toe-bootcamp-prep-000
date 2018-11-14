class TicTacToe
  
  WIN_COMBINATIONS = [[0,1,2],[0,4,8],[0,3,6],[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8]]
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  def play
  until over?
    turn
  end
  
  if won?
    puts "Congratulations #{winner}!"
  else 
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

def input_to_index(user_input)
  index = user_input.to_i - 1
end

def move(index, player)
  @board[index] = player
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    puts "I'm sorry, that is not a valid move."
    turn
  end
end

def turn_count
  @board.reject{|space| space == " "}.length
end

def current_player
  turn_count % 2 == 1 ? "O" : "X"
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination
    else 
      false
    end
  end 
  false
end

def full?
  @board.reject{|i| i == " "}.length ==9
end

def draw?
  if !won? && full?
    return true
  end
  false
end

def over?
  if won? || draw? || full?
    true
  end
end

def winner
  won? ? @board[won?[0]] : nil
end
  
end