class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  

WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]]
 
  def input_to_index(arg)
    arg = arg.to_i
    arg = arg - 1
  end
  
  ######
  
   #get board element
  # def get_board_element
  #   @borad[index]
  # end
  
  # #set borad element
  # def set_board= value 
  #   @borad[index] = value 
  # end 
  
  def position_taken?(index)
    @board[index]=="X" || @board[index]=="O"
  end

def valid_move?(board, index)
  if (index.between?(0,8)) && (!position_taken?(board,index))
    return true
  else 
    return false 
  end 
end 

def move(board, index, player_char)
    board[index] = player_char
  end 
  
  
  
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    # if valid_move?
    #   move
    #   display_board
    # else
    #   turn
    # end
  end
  
end 

tic = TicTacToe.new

#   def move(index, player_char="X")
#     get_board_element = player_char
#   end 

#   def position_taken?(index)
#   # if (get_board_element =="X" || get_board_element == "O")
#     {|token| token == "X" || token == "O"}
# end

 
#   def valid_move?
#   if (index.between?(0,8)) && (!position_taken?)
#     true
#   else 
#     false
#   end 
#   end 

  

# #   def won?(@board)
# #       # check win combination
# #         WIN_COMBINATIONS.each do |combination| 
# #           win_index_1 = combination[0]
# #           win_index_2 = combination[1]
# #           win_index_3 = combination[2]
# #           position_1 = @board[win_index_1] 
# #           position_2 = @board[win_index_2] 
# #           position_3 = @board[win_index_3] 
# #           if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
# #             return combination 
# #           else 
# #             false
# #           end 
# #     end
# #     false
# #   end


# #   def full?(@board)
# #         if     (@board.all? do |element|
# #               element == " " || element == nil || element==""
# #               end)
# #           # puts "borad empty"
# #           return false
# #         elsif (@board.any?{|element| element ==" " || element== nil})#=> true
# #           # puts "borad in progress"
# #           return false 
# #         else
# #           # puts "borad full"
# #           true
# #         end 
# #         # return true
# #   end
  
# #   def draw?(@board)
# #     !won?(@board) && full?(@board)
# #   end
  
# #   def over?(@board)
# #     won?(@board) || draw?(@board) || full?(@board) 
# #   end

# #   def winner(@board)
# #     combo = won?(@board)
# #     if combo
# #       return @board[combo[0]]
# #     end
# #   end

# #   def play(@board)
# #     until over?(@board)
# #       turn(@board)
# #     end
# #     if won?(@board)
# #       puts "Congratulations #{winner(@board)}!"
# #     elsif draw?(@board)
# #     puts "Cat's Game!"
# #   end
# # end

# end
  