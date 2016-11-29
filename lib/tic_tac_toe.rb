class TicTacToe
   def initialize()
     @board = Array.new(9, " ")
   end
   WIN_COMBINATIONS = [
     [0,1,2], # Top row
     [3,4,5], # Middle row
     [6,7,8], # Bottom row
     [0,3,6], # Left column
     [1,4,7], # Middle column
     [2,5,8], # Right column
     [0,4,8], # Across
     [2,4,6]  # Across
   ]

   def display_board
     puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
     puts "-----------"
     puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
     puts "-----------"
     puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
   end

   def move(index, player_character = "X")
     @board[index.to_i - 1] = player_character
   end

   def position_taken?(index)
     @board[index] != " " && @board[index] != ""
   end

   def valid_move?(index)
     index = index.to_i - 1;
     index.between?(0,8) && !position_taken?(index)
   end

   def turn
     puts "Please enter 1-9:"
     input = gets.strip
     if valid_move?(input)
       move(input, current_player)
       display_board
     else
       turn
     end
   end

   def turn_count
     counter = 0
     @board.each do |move|
       if move == "X" || move == "O"
         counter += 1
       end
     end
     counter
   end

   def current_player
     turn_count % 2 == 0 ? "X" : "O"
   end

   def won?
     WIN_COMBINATIONS.each do |moves|
       if @board[moves[0]] == "X" && @board[moves[1]] == "X" && @board[moves[2]] == "X"
         return moves
       end
       if @board[moves[0]] == "O" && @board[moves[1]] == "O" && @board[moves[2]] == "O"
         return moves
       end
     end
     false
   end

   def full?
     @board.all? { |space| space == "X" || space == "O"}
   end

   def draw?
     !won? && full?
   end

   def over?
     won? || full? || draw?
   end

   def winner
     if draw? || !over?
       return nil
     else
       return @board[won?[0]]
     end
   end

   def play
     while !over?
       turn
     end
     if won?
       puts "Congratulations #{winner}!"
     end
     if draw?
       puts "Cats Game!"
     end
   end
 end
