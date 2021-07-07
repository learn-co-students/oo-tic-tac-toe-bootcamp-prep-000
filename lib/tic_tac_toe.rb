class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [6,4,2],
    [0,4,8],
    [1,4,7],
    [0,3,6],
    [2,5,8]
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

   def move(position, char)
     @board[position] = char
   end

   def position_taken?(index)
     if (@board[index] ==  " " || @board[index] == "" || @board[index] == nil)
       false
     else
       true
     end
   end

   def valid_move?(index)
     index.between?(0,8) && !position_taken?(index)
   end

   def turn_count
     counter = 0
     @board.each do |i|
       if i == "X" || i == "O"
         counter += 1
       end
     end
     counter
   end

   def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

   def turn
     puts "Please enter 1-9:"
     input = gets.strip
     index = input_to_index(input)
     char = current_player
      if valid_move?(index)
        move(index, char)
        display_board
      else
        turn
      end
   end

   def won?
   winner = false
     WIN_COMBINATIONS.each do |win_combination|
       win_index_1 = win_combination[0]
       win_index_2 = win_combination[1]
       win_index_3 = win_combination[2]

         position_1 = @board[win_index_1]
       position_2 = @board[win_index_2]
       position_3 = @board[win_index_3]


       winning_move = (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")


         if winning_move
         winner = true
         return win_combination # return the win_combination indexes that won.
         else
         winner = false
         end
     end
    winner
   end

   def full?
     @board.all?{|occupied| occupied != " "}
   end

   def draw?
     !(won?) && (full?)
   end

   def over?
  won? || full? || draw?
   end

   def winner
     WIN_COMBINATIONS.detect do |win_combo|
       if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
         return "X"
       elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
         return "O"
       else
         nil
       end
     end
   end

   def play
    while over? == false
     turn
    end
    if won?
     puts "Congratulations #{winner}!"
    elsif draw?
     puts "Cat's Game!"
    end
   end

end
