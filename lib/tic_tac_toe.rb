=begin
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board=(my_board)
    @board=my_board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end


  def input_to_index(user_input)
    user_input.to_i-1
  end

  def move(index, player_character)
     @board[index]=player_character
  end

  def valid_move?(index)
    index.between?(0,8)&& !position_taken?(index)

  end

  # re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
  def position_taken?(index)
   @board[index]=="X"||@board[index]=="O"

  end

  def turn

    puts "Please enter 1-9:"
    input=gets.strip
    index=input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      puts "Invalid move"
      turn
    end
  end


   def turn_count
     counter =0
     @board.each do |space|

       if space=="X"
         counter += 1
       elsif space=="O"
         counter += 1
       end
     end
     return counter
   end

   def current_player
     turn_count.even? ? "X" : "O"
     end



     WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]

     def won?
     WIN_COMBINATIONS.each do |win_combination|
       win_index_1=win_combination[0]
       win_index_2=win_combination[1]
       win_index_3=win_combination[2]

       position_1=@board[win_index_1]
       position_2=@board[win_index_2]
       position_3=@board[win_index_3]

       if position_1=="X"&& position_2=="X" && position_3=="X"
         return win_combination
       elsif position_1=="O"&& position_2=="O" && position_3=="O"
         return win_combination
       end
     end
      return false
     end

     def game_won?
       won?.class==Array
     end

     def full?
       @board.all? do |spaces|
         spaces=="X"||spaces=="O"
       end
     end

     def draw?
       if full? && !game_won?
         return true
       else
         return false
       end
     end

     def over?
       if game_won?||draw?||full?
         return true
       else
         return false
       end
     end

     def winner
       if game_won?
         return @board [won?[0]]
       end
     end

     def play

        while !over? && turn_count<12

        turn

      end
    # require "pry"
    #   binding.pry
         if game_won?
           puts "Congratulations #{winner}!"
         elsif draw?
           puts "Cat's Game!"
         end

      end

end
=end
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board=(my_board)
    @board=my_board
  end

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end


def input_to_index(user_input)
  user_input.to_i-1
end

def move(index_of_board, player_character)
   @board[index_of_board]=player_character
end

def valid_move?(index)
  index.between?(0,8)&& !position_taken?(index)

end

# re-define your #position_taken? method here, so that you can use it in the #valid_move? method above.
def position_taken?(index)
 @board[index]=="X"||@board[index]=="O"

end

def turn

  puts "Please enter 1-9:"
  input=gets.strip
  index=input_to_index(input)
  if valid_move?(index)
    move(index,current_player)
    display_board
  else
    puts "Invalid move"
    turn
  end
end


 def turn_count
   counter =0
   @board.each do |space|

     if space=="X"
       counter += 1
     elsif space=="O"
       counter += 1
     end
   end
   return counter
 end

 def current_player
   turn_count.even? ? "X" : "O"
   end



   WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8]]

   def find_winning_combo
   WIN_COMBINATIONS.each do |win_combination|
     win_index_1=win_combination[0]
     win_index_2=win_combination[1]
     win_index_3=win_combination[2]

     position_1=@board[win_index_1]
     position_2=@board[win_index_2]
     position_3=@board[win_index_3]

     if position_1=="X"&& position_2=="X" && position_3=="X"
       return win_combination
     elsif position_1=="O"&& position_2=="O" && position_3=="O"
       return win_combination
     end
   end
    return false
   end

   def won?
     find_winning_combo
   end

   def full?
     @board.all? do |spaces|
       spaces=="X"||spaces=="O"
     end
   end

   def draw?
     if full? && !won?
       return true
     else
       return false
     end
   end

   def over?
     if won?||draw?||full?
       return true
     else
       return false
     end
   end

   def winner
     if won?
       return @board [find_winning_combo[0]]
     end
   end

   def play

      while !over?
      turn
    end
  # require "pry"
  #   binding.pry
       if won?
         puts "Congratulations #{winner}!"
       elsif draw?
         puts "Cat's Game!"
       end

       end

     end
