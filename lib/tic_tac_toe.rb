class TicTacToe
  def initialize
    @board=Array.new(9," ")
  end
  
  WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
  ]

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      index_one=win_combo[0]
      index_two=win_combo[1]
      index_three=win_combo[2]
      if ((@board[index_one]=="X" && @board[index_two]=="X" && @board[index_three]=="X") || (@board[index_one]=="O" && @board[index_two]=="O" && @board[index_three]=="O"))
        return win_combo
      end
    end
    return false
  end
  
  def full?
    @board.all? {|element| (element=="X" || element=="O")}
  end
 
def draw?
  if (!won? && full?)
    return true
  elsif (!won?  && !full?)
    return false
  elsif won?
    return FALSE
  end
end
 
def over?
  if (won? || draw? || full?)
    return true
  else
    return false
  end
end

def winner
  if won?
    if @board[won?[0]]=="X"
      return "X"
    else
      return "O"
    end
  else
    return nil
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
  return (user_input.to_i-1)
end

def move(index,value="X")
  @board[index]=value
end

def valid_move? (index)
  if ((index.between?(0,8)) && (!position_taken?(index)))
    return TRUE
  else
    return false
  end
end

def turn_count
  counter=0
  @board.each do |element|
    if element=="X" || element=="O"
      counter+=1
    end
  end
  counter
end

def current_player
  if turn_count%2==0
    "X"
  else
    "O"
  end
end

def turn
  puts "Please enter 1-9:"
  user_input=gets.strip
  index=input_to_index(user_input)
  if (valid_move?(index))
    move(index,current_player)
    display_board
  else
    turn
  end
end

def play
  until over?
    turn
  end
  
  if won? && winner=="O"
    puts "Congratulations O!"
  elsif won? && winner=="X"
    puts "Congratulations X!"  
  else
    puts "Cat's Game!"
  end

end
  
  
  
  
  
end