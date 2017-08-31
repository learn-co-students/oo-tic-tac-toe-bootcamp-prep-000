class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
         def display_board
           puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
           puts "-----------"
           puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
           puts "-----------"
           puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
         end
   def input_to_index(input)
     "#{input}".to_i - 1
   end

   def move(index, char)
     @board[index] = char
   end

   def position_taken?(index)
     if @board[index] == " " || @board[index] == "" || @board[index] == nil
       return false
    else
       return true
    end
  end

   def valid_move?(index)
     if position_taken?(index) || index > 8 || index < 0
             return false
     else
             return true
     end
     end

   def turn
           puts "Please enter 1-9:"
           ans = gets.strip
           index = input_to_index(ans)
           log = valid_move?(index)
             if log == false
               puts "invalid"
               turn
             else
               move(index, current_player)
               display_board
             end
         end
         def turn_count
           counter = 0
           @board.each do |item|
                if "#{item}" != " "
                 counter += 1
               end
           end
         return counter
         end
         def current_player
           if turn_count % 2 == 0
             return "X"
           else
             return "O"
           end
         end
         def won?
           counter = 0
           while counter < WIN_COMBINATIONS.length

             win_index_1 = WIN_COMBINATIONS[counter][0]
             win_index_2 = WIN_COMBINATIONS[counter][1]
             win_index_3 = WIN_COMBINATIONS[counter][2]

             position_1 = @board[win_index_1] # load the value of the board at win_index_1
             position_2 = @board[win_index_2] # load the value of the board at win_index_2
             position_3 = @board[win_index_3] # load the value of the board at win_index_3

             if position_1 == "X" && position_2 == "X" && position_3 == "X"
               return WIN_COMBINATIONS[counter] # return the win_combination indexes that won.
             elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
               return WIN_COMBINATIONS[counter]
             else
               counter += 1
             end
           end
         end
         def full?
           @board.none? do |i| i == " "
           end
         end
         def draw?
         # returns true if the board has not been won and is full
         #false if the board is not won and the board is not full, and false if the board is won.
           if !won? && full?
             return true
           else
             return false
           end
         end
         def over?
         #that accepts a board and returns true if the board has been won, is a draw, or is full
           if won? || draw? || full?
             return true
           else
             return false
           end
         end
         def winner
           counter = 0
           while counter < WIN_COMBINATIONS.length

             win_index_1 = WIN_COMBINATIONS[counter][0]
             win_index_2 = WIN_COMBINATIONS[counter][1]
             win_index_3 = WIN_COMBINATIONS[counter][2]

             position_1 = @board[win_index_1] # load the value of the board at win_index_1
             position_2 = @board[win_index_2] # load the value of the board at win_index_2
             position_3 = @board[win_index_3] # load the value of the board at win_index_3

             if position_1 == "X" && position_2 == "X" && position_3 == "X"
               return "X" # return the win_combination indexes that won.
             elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
               return "O"
             else
               counter += 1
             end
           end
         end
  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
