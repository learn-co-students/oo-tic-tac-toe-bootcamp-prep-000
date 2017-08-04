class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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

 def input_to_index(input)
   index = input.to_i-1
 end

 def move(index, value)
     @board[index]=value
   end

   def valid_move?(index)
     if(index.between?(0, 8))
       !position_taken?(index)
     else
       false
     end
   end

   def position_taken?(index)

     if((@board[index]==" ") || (@board[index]=="") || (@board[index]==nil))
       false
     else
       true
     end
   end

   def turn

     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)

     if valid_move?(index)
       move(index,current_player)
       display_board
     else
         turn
     end

   end

   def turn_count
     counter = 0
     @board.each do |element|
       if element =="X" || element == "O"
         counter +=1
       end
     end
     counter
   end

   def current_player
     turn_count%2 == 0 ? "X" : "O"
   end

   def won?
     WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = @board[win_index_1]
       position_2 = @board[win_index_2]
       position_3 = @board[win_index_3]

       if (position_1 =="X" && position_2 =="X" && position_3 == "X") || (position_1 =="O" && position_2 =="O" && position_3 == "O")
         return win_combination
       end
     end
     false
   end

   def full?
     @board.each do |element|
       if element ==" " || element==nil
         return false
       end
     end
     true
   end

   def draw?
     if full? && !won?
       return true
     else
       return false
     end
   end

   def over?
     if won?|| full? || draw?
       return true
     else
       return false
     end
   end

   def winner
     if won?
       return @board[won?[0]] #Grabs the value from the first element in the winning array...
     else return nil
     end
   end

   def play

     until over?
       turn
     end

     if won?
       champ = winner
       puts "Congratulations #{champ}!"
     elsif draw?
       puts "Cat\'s Game!"
     end
   end


end
