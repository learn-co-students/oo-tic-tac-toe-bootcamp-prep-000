class TicTacToe
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
  
  def initialize
    @board = Array.new(9, ' ')
  end 

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

def move(position, token)
  @board[position] = token
end

def position_taken?(position)
  @board[position] != " " && @board[position] != ""
end

def valid_move?(index)
  index.between?(0,8) && !position_taken?(index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  @board.count{|token| token == 'X' || token == 'O'}
end

def current_player
  turn_count.even? ? 'X' : 'O'
end

def won?
  WIN_COMBINATIONS.each do |combo|
   return combo if combo.all?{|x| @board[x] == 'X'} || combo.all?{|x| @board[x] == 'O'}
 end
 false
end

def full?
  @board.all?{|char| char == 'X' || char == 'O'}
end

def draw?
  !won? && full?
end

def over?
  won? || full? || draw?
end

def winner
  WIN_COMBINATIONS.each{|combo| return 'X' if combo.all?{|x| @board[x] == 'X'}} 
  return nil if !won?
  'O'
end

def play
  until over?
    turn
  end
  puts "Congratulations #{winner}!" if won?
  puts "Cat's Game!" if draw?
end
end