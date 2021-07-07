class TicTacToe

  WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def initialize(board=nil)
    @board = board || Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    return user_input.to_i - 1
  end

  def move(index, char = current_player)
    @board[index] = char
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == nil)
  end

  def valid_move?(index)
    !position_taken?(index) && index >= 0 && index <= 9
  end

  def turn_count
    turns = 0
    @board.each do |counter|
      if counter == "X" || counter == "O"
        turns+=1
      end
    end
    return turns
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
   puts "Please enter 1-9:"
   user_input = gets.strip
   index= input_to_index(user_input)
   if valid_move?(index)
     move(index)
     display_board
   else
     puts "invalid"
     turn
   end
 end

 def won?
    #  this is checking each win combo against the @board
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]]
      return combo
    end
  end
  return false
 end

 def full?
   @board.all? do |index|
     index != " "
   end
 end

 def draw?
   !won? && full?
 end

 def over?
   won? || draw?
 end

 def winner
  if won?
    return @board[won?[0]]
  else
    return nil
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
