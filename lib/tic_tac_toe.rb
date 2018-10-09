class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
 WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  ]
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  user_input.to_i - 1
end

  
 def move(index, player_token = "X")
  @board[index] = player_token 
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
 def current_player
  if turn_count.even?
    return "X"
  else
    return "O"
  end
end
 
  
  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def won?
    WIN_COMBINATIONS.each do |combination|
     if (@board[combination[0]]==@board[combination[1]] && @board[combination[1]]==@board[combination[2]])&& position_taken?(combination[0])
      return combination
end
  end
  return false
end 

def full?
   @board.all? do |position|
     position == "X" || position == "O"
   end
 end

 
 def draw?
   !won? && full?
   end
 
  def over?  
    won? || draw?
  end
   
    def winner
    combination = won?
     if combination
      return @board[combination[0]]
  else
    return nil
  end
end

   def play
  
  turn until over?
if won?
  puts "Congratulations #{winner}!"
elsif draw?
  puts "Cat\'s Game!"
  end
end
   
 end