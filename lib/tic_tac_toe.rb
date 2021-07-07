class TicTacToe 
  def initialize
    @board = Array.new(9, " ") 
  end 
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
    ]
  
  def display_board 
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
    
  def input_to_index(input)
    index = input.to_i-1
  end 
  
  def move(index, token="X")
    @board[index] = token 
  end 
  
  def position_taken?(index)
    !(@board[index] == " " || @board[index].nil?)
  end 
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end 
  
  def turn_count
    count = 0 
    @board.each do |index|
      if index == "X" || index == "O"
      count += 1 
      end 
    end 
  return count
end 

def current_player 
  if turn_count.even?
    player = "X"
  else 
    player = "O"
  end 
end 

def turn
    puts "Select 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else 
      turn 
  end 
end 
  
def won? 
  WIN_COMBINATIONS.detect do |winning_combo| 
    index_0 = winning_combo[0]
    index_1 = winning_combo[1]
    index_2 = winning_combo[2]
    
    position_1 = @board[index_0]
    position_2 = @board[index_1]
    position_3 = @board[index_2]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return winning_combo
    end 
  end 
  return false 
end 

def full?
  @board.all? {|index|
   index == "X" || index == "O"}
end
  
def draw?
   !won? && full?
end 
    
def over?
   won? || full?
end 
  
def winner
  index = []
  index = won? 
  if !index 
    return nil 
  else 
  if @board[index[0]] == "X"
    return "X"
  else
    return "O"
  end 
end 
end 

def play 
  until over? || draw?
    turn 
  end 
  if draw?
    puts "Cat's Game!"
  else 
    puts "Congratulations #{winner}!"
  end  
end

end 




