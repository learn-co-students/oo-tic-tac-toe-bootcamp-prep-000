class TicTacToe
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
    end

WIN_COMBINATIONS =[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(str)
str.to_i - 1
end

def move(index, ch ="X")
@board[index] = ch
end

def position_taken?(index)#
if @board[index] == " " || @board[index] == "" || @board[index] == nil
  return false
else
  return true
end
end

def valid_move?(index)
index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input  =  gets.strip
  index = input_to_index(input)
  if valid_move?(index)
        move(index, current_player)
       display_board
  else
      turn
  end
end

def turn_count
@board.count {|token| token == "X" || token == "O"}
end

def current_player
      turn_count % 2 == 0 ? "X" : "O"
end

def won?
WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = @board[win_index_1] # load the value of the board at win_index_1
  position_2 = @board[win_index_2] # load the value of the board at win_index_2
  position_3 = @board[win_index_3]

  if position_1 == position_2 && position_2 == position_3 && position_taken?(win_index_1)
    return win_combination
  end
  #if position_1 == "X" && position_2 == "X" && position_3 == "X"
  #  return win_combination
  #elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  #  return win_combination
  #end
end
false
end

def full?
count = 0
  @board.each do |el|
    if el == "X" || el == "O"
      count+=1
    end
  end
  if count == 9
    return true
  else
    return false
  end
end

def draw?
  !won? && full?
end

def over?
  return true if (won? || draw?)
end

def winner
  #binding.pry
  if won?
    @board[won?[1]]
  else
  #elsif draw?(board) && full?(board)
     return nil
  end
end

def play
  until over?
    turn
  end

  if winner
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end

end
