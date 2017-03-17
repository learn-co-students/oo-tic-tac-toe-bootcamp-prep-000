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
 def input_to_index(string)
  string = string.to_i
  string - 1
 end
 def move(index, token = "X")
  @board[index] = token
 end
 def position_taken?(index)
  @board[index] == " " ? false : true
 end
 def valid_move?(position)
  position.between?(0, 8) && !position_taken?(position)
 end
 def turn
  puts "Pick a number from 1 - 9"
  input = input_to_index(gets)
  if valid_move?(input)
     move(input, current_player) && display_board
   elsif !valid_move?(input)
     turn
   end
  end
  def turn_count
    @board.count {|el| el != " "}
  end
  def current_player
   turn_count.odd? ? "O" : "X"
  end
  def won?
    winnie =  WIN_COMBINATIONS.select { |el|
     @board[el[0]] == @board[el[1]] &&
     @board[el[1]] == @board[el[2]] &&
     position_taken?(el[0]) }
  if winnie == []
    return false
  else winnie[0]
   end
  end
  def full?
   turn_count == 9 ? true : false
  end
  def draw?
   full? && !won?
  end
  def over?
   won? || draw?
  end
  def winner
   combos = won?
   won? ? @board[combos[0]] : nil
  end
  def play
    display_board
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
