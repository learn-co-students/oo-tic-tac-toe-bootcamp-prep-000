class TicTacToe
 def initialize
   @board =  Array.new(9, " ")
 end


 WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
# Define display_board that accepts a board and prints
# out the current state.
def display_board
   puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
   puts"-----------"
   puts " #{@board[3]} | #{@board[4]} | #{@board[5]} " 
   puts"-----------"
   puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
 end

 # code your input_to_index and move method here!
def input_to_index(user_input)
  converted_input="#{user_input}".to_i - 1
 end

# move
def move(new_index,my_char="X")
 my_char=current_player
 @board[new_index]=my_char
 end 

# code your #position_taken? method here!
def position_taken?(index)
  if(@board[index]==" ")||(@board[index]=="")||(@board[index]==nil)
     pos=false;
  elsif (@board[index]=="X")||(@board[index]=="O")
     pos= true;
  else  
  end
  return pos;
    
 end

# code your #valid_move? method here
def valid_move?(index)
  if !position_taken?(index) && index.between?(0,8)
     return true 
  else
    return false
  end  
 end  

#single complete turn
def turn
   puts "Please enter 1-9:"
   input=gets.strip
   index=input_to_index(input)
   if(valid_move?(index))
     move(index)
     display_board
    else
    turn
    end
 end

 def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
def won?
 WIN_COMBINATIONS.each { |win_combination| 
  win_index_1=win_combination[0]
  win_index_2=win_combination[1]
  win_index_3=win_combination[2]
 
   position_1=@board[win_index_1]
   position_2=@board[win_index_2]
   position_3=@board[win_index_3]
     
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      else
        false
      end 
  }
  return false
  end
 
 def full?
  @board.none?{|board| board==" "}
  end
  
  def draw?
   if !won? && full? then true
   else  false
   end
   end

def over?
 if turn_count==1 then false 
   #elsif turn_count(board)==2 then true
 end
  
 if won?||draw?||full? then true
 else false
 end
 end

def winner
   index=[]
   index=won?
   if index==false then nil
    elsif @board[won?[0]]=="X" then "X" 
    elsif @board[won?[0]]=="O" then "O"
    end
 end

 # Define your play method below
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
  
