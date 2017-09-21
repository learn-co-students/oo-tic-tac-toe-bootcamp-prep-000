class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def display_board
   print " #{@board[0]} | #{@board[1]} | #{@board[2]} \n-----------\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n-----------\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
 end

 def input_to_index(input)
   index = input.to_i - 1
 end

 def move(index, char)
  @board[index] = char
 end

 def position_taken?(index)
   !(@board[index].nil? || @board[index] == " ")
 end

 def valid_move?(index)
   if index.between?(0, 8)  && position_taken?(index) == false
     return true
   else
     return false
   end
 end

 def turn
   puts "Please enter 1-9:"
   index = input_to_index(gets.strip)
   if valid_move?(index)
     move(index, current_player)
   else
     puts "Invalid input."
     turn
   end
   display_board
 end

 def turn_count
   counter = 0
   @board.each do |plays|
     if plays == "X" || plays == "O"
       counter += 1
     end
   end
  counter
 end

 def current_player
   if turn_count % 2 == 0
     "X"
   else
     "O"
   end
 end

 def won?
   WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

       position_1 = @board[win_index_1]
       position_2 = @board[win_index_2]
       position_3 = @board[win_index_3]

       if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O"  && position_3 == "O"
       return win_combination
      end
    end
    false
 end

 def full?
   if  @board.include?(" ")
     false
   else
     true
   end
 end

 def draw?
   if full? && won? == false
     return true
   else
     false
   end
 end

 def over?
   if won? || draw?
     return true
   else
     false
   end
 end

 def winner
   if won? == false
     return nil
   elsif @board[won?[0]] == "X"
     return "X"
   else
     return "O"
   end
 end

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
