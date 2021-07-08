class TicTacToe
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [2, 4, 6],
  [0, 4, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
def input_to_index(input)
  index = input.to_i
  index - 1
end

def move(input,x)
  @board[input] = x
end

def position_taken?(index)
  if @board[index] == " " ||
    @board[index] ==  "" || 
    @board[index] == nil
   return false 
  else
   return true
  end
end

def valid_move?(index)
    if position_taken?(index) == false && 
      index.between?(0, 8) == true 
     return true
    else false
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  user_input = input_to_index(input)
    if valid_move?(user_input) == false
    turn
    else
    move(user_input,current_player)
    end
  display_board
end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def won?
           WIN_COMBINATIONS.each do |wins|
            if wins.all?{|win_index| 
              @board[win_index] == "X"} ||  
              wins.all?{|win_index| 
                @board[win_index] == "O"}
                return wins
              end
              end
              return false
end
 
 def full?
    @board.all? {|index| index == "X" || index == "O"}
  end
  
  def draw?
  if full? == true &&
    won? == false 
    return true 
  end
end 

def over?
  if won? && !full? ||
    draw? == true ||
    full? == true 
    return true 
  else 
    return false 
  end 
    end
    
def winner
  if won? == false
    return nil 
  else 
   x = @board.select {|x| x == "X"}
   o = @board.select {|o| o == "O"}
   
   if won?  &&
     x.length > o.length 
     return "X"
   else 
     return "O"
 end
 end
end 

def play
  until over? == true ||
  won? == !false ||
  draw? == true ||
  turn
end
  
  if over? == true && 
draw? == true
puts "Cat's Game!"
elsif winner == "X"
puts "Congratulations X!"
elsif winner == "O"
puts "Congratulations O!"
end 
end

end 