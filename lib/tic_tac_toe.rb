class TicTacToe
  attr_accessor :board
  def initialize(board = nil)
    @board = Array.new(9, " ")
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
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(user_input)
  user_input.to_i - 1
  end
  
  def move(index, player)
  board[index] = player
  end
  
  def position_taken?(index)
  board[index] != " " && board[index] != ""
  end
  
  def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
  count = 0
  board.each do |index|
    if(index != " ")
    count += 1 
    end
  end  
  return count
  end
  
  def current_player
   return (turn_count.odd?)? "O" : "X"  
  end
  
  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
     move(index, current_player) #IMPORTANT!!!!! don't forget to use the current_player method as a param
     display_board
  else
    turn
  end
  end
  
  def won?
   WIN_COMBINATIONS.detect do |array|
   board[array[0]] == board[array[1]] && board[array[0]] == board[array[2]] && position_taken?(array[0])
    end
  end
  
  def full?
  board.none? {|index| index == " "}
  end
  
  def draw?
    return (full? && !won?)? true : false
  end
  
  def over?
    return (won? || full? || draw?)? true : false
  end
  
  def winner
    return (won?)? board[won?[0]] : nil
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