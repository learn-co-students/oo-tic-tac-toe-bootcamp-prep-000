class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
 


  def input_to_index(index)
   @index = index.to_i - 1
  end 
  
   def move(index, current_player = "X") 
    @board[index.to_i] = current_player
   end

 def position_taken?(index)
   if (@board[index] == "X" || @board[index] == "O")
     return true 
   else 
     return false
   end
 end
 
  def valid_move?(index)
  if   index.between?(0,8) && (@board[index] == " " || @board[index] == "")
  return true 
  else 
  return false
  end
 end 
 
 
def turn
   puts "Please enter 1-9:"
     index = gets.strip
     index = input_to_index(index)
       until valid_move?(index) == true
         puts"Not a valid move. Please enter 1-9:"
         index = gets.strip
         index = input_to_index(index)
         end
    move(index, current_player)
    display_board
end 

def turn_count
  count =0
  @board.each do |turn| 
    if turn == "O" || turn == "X" 
      count += 1 
    end
  end
    return count
end

def current_player
  if turn_count% 2 == 0 
    return "X"
  elsif turn_count% 2 == 1 
    return "O"
  else 
    return "Error"
  end
end

def won?
  WIN_COMBINATIONS.each do |place|
   
    win1 = place[0]
    win2 = place[1]
    win3 = place[2]
    
    win_char1 = @board[win1]
    win_char2 = @board[win2]
    win_char3 = @board[win3]
    
    if (win_char1 == "X" && win_char2 =="X" && win_char3 == "X")||(win_char1 == "O" && win_char2 =="O" && win_char3 == "O")
      return place
      end
  end 
  return false
end 


def full?
    @board.each do |check|
      if check == "" || check == " "  || check == nil
      return false
      end
    end
    return true
end

def draw?
   !won? && full?  
end 


def over?

  if won?  || draw?
  return true
  end
 return false
end

def winner
  if won?
  
    if @board[won?[0]] == "X"
      return "X"
    elsif @board[won?[0]] == "O"
    return "O"
    end 
  end
end 

def play 
 puts "Cat's Game!" 
 display_board
 until over? 
 turn_count
 turn
 end
 
if draw? 
       puts "Cats Game!"
 else
       puts "Congratulations #{winner}!"
 end
end 

 
def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end 