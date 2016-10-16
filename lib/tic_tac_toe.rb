def input_to_index(s)
return (s.to_i)
end
class TicTacToe
  def initialize()
    @board=Array.new(9," ")
  end
def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
def valid_move?(str)
  n=input_to_index(str)
  return n>0&&n<10&&@board[n-1]!='X'&&@board[n-1]!='O'
end
def move(n,char)
  @board[n-1]=char
end

def turn()
  i=-1
  puts("Please enter 1-9:")
  loop do
    input=gets
    if valid_move?(input)
      i=input_to_index(input)
      break
    end
    puts("Invalid move.")
  end
  move(i,current_player())
  display_board()
end
def turn_count()
  r=0
  @board.each {|ch|(ch=='X'||ch=='O')?r+=1:0}
  return r
end
def current_player()
  return (turn_count()%2==0)?'X':'O'
end

def play()
  until(over?()||won?()||draw?()) do
    turn()
  end
  if draw?()
    puts "Cats Game!"
  else
    puts "Congratulations #{winner()}!"
  end
end

def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
def won?()
  return WIN_COMBINATIONS.find{|comb|
    ((comb.all?{|n| @board[n]=='X'})||(comb.all?{|n| @board[n]=='O'}))}
end
def full?()
  return @board.all?{|a|a=='X'||a=='O'}
end
def draw?()
  return (!(won?()))&&full?()
end
def over?()
  return won?()||full?()
end
def winner()
  l=won?()
  if l==nil
    return nil
  else
    return @board[l[0]]
  end
end
end
