require 'pry'
class TicTacToe

  def initialize(board=[" "," "," "," "," "," "," "," "," "])
    @board=board
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def move(index, char = "X")
  @board[index]=char
end

def position_taken?(index)
   (@board[index]=="X" || @board[index]=="O")
end

def valid_move?(index)
     !position_taken?(index) && index.between?(0,8)
end

def turn
  puts "Please enter 1-9:"
  position = gets.strip
  @index = (position.to_i - 1)
    #binding.pry
  if valid_move?(@index)
    move(@index,current_player)
    display_board
  else
    turn
  end
end

def turn_count
  occupied = 0
  @board.each do |space|
    if !(space == "" || space == " ")
      occupied+=1
    end
  end
  return occupied
end

def current_player
  if turn_count%2==0
    return "X"
  else
    return "O"
  end
end



def won?
WIN_COMBINATIONS.each do |wincombo|
  if wincombo.all? do |square|
     @board[square] == "X"
   end
     return wincombo
   elsif wincombo.all? do |square|
     @board[square] == "O"
   end
     return wincombo
   end
 end
  return false
end

def full?
  @board.all? do |position|
    position != " "
  end
end

def draw?
  !won? && full?
end

def over?
  if draw? || won?
    return true
  end
end

def winner
  if won? != false
    return @board[won?[0]]
  end
end





def play
  while !over?
      turn
    end
  if draw?
    puts "Cats Game!"
  else
    puts "Congratulations #{winner}!"
  end
end








end
