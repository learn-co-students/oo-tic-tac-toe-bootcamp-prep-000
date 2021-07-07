class TicTacToe
  def initialize (board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
  
  def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts "-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
   puts "-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(x)
   index = x.to_i 
   index - 1 
  end
  
  def move(index, player = "X")
   @board[index] = player
  end 
  
  def position_taken?(index)
   !(@board[index] == "" || @board[index] == " " || @board[index] == nil)
  end
  
  def valid_move?(index)
   index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
   puts "Please enter 1-9:"
   input = gets.strip
   index = input_to_index(input)
   if valid_move?(index)
    player = current_player
    move(index, player)
   else
    turn
   end
  display_board
 end

 def turn_count
  count = 0 
  @board.each do |player|
    if player == "X" || player == "O"
      count += 1 
    end
   end
    return count
 end
 
 def current_player
  if turn_count % 2 == 0 
    return "X"
  else
    return "O"
  end
 end
 
 def won?
    WIN_COMBINATIONS.detect do |combo|
       @board[combo[0]] == @board[combo[1]] && 
       @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0]) 
    end
  end
  
  def full?
   @board.none? do |value|
    value == " "
  end
 end


 def draw?
  won? == nil && full? == true
 end

 def over?
  draw? == true || won? != nil
 end
 
 def winner
  if won? == nil
    return nil
  elsif @board[won?[0]] == "O"
    return "O"
  elsif @board[won?[0]] == "X"
    return "X"
  end 
 end

 def play
  until over? ==  true
   turn
  end
  if draw? == true 
   puts "Cat's Game!"
  elsif winner == "X"
   puts "Congratulations X!"
  elsif winner == "O"
   puts "Congratulations O!"
 end
end

end