class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts
  end

  def input_to_index (user_input)
    user_input.to_i - 1
  end

  def move(pos,char="X")
    @board[pos]=char
    return @board
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index > 8 || index < 0
      return false
    elsif position_taken?(index)
      return false
    else
      return true
    end
  end

  def turn_count
    counter = 0
    @board.each {|x| counter +=1 if x != " " }
    counter
  end

  def current_player
  if turn_count%2 == 0
    return "X"
  else
    return "O"
  end
  end

  def turn
  puts "Please enter 1-9:"
  turn_in = gets.chomp
  turn_in = input_to_index(turn_in)
  is_valid = valid_move?(turn_in)
  if !is_valid
    turn
  end
  move(turn_in,current_player)
  display_board
end

def won?
  WIN_COMBINATIONS.each do |z|
    if @board [z[0]] != " " && @board [z[0]]==@board [z[1]] && @board [z[1]]==@board [z[2]]
      return z
    end #of if statement
  end #of do loop
  return false
end #of method definition

def full?
  return false if @board.include?(" ")
  return true
end

def draw?
  return true if !won? && full?
  return false
end

def over?
  return true if draw?
  return true if won?
  return false
end

def winner
  return @board [won?[0]] if won? != false
  return nil
end

def play
  while !over?
    turn
  end
  if won?
     puts "Congratulations #{winner}!"
   else
     puts "Cat's Game!"
   end
end




end
