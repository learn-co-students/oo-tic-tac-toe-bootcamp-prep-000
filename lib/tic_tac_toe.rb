class TicTacToe
  WIN_COMBINATIONS=[
  [0,1,2],[3,4,5],[6,7,8],
  [0,3,6],[1,4,7],[2,5,8],
  [0,4,8],[2,4,6]
]
def initialize(board=nil)
@board= Array.new(9," ")
end
def display_board
puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
puts "-----------"
puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
puts "-----------"
puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end
  def input_to_index(user_input)
  (user_input.to_i) -1
  end

def move(position,token)
  @board[position]=token
end

def position_taken?(position)
@board[position]=="X" || @board[position]=="O"
end

def valid_move?(position)
!position_taken?(position)&&@board[position]==" "&&position<9 && position>=0
end
def turn_count
  count=0
  @board.each{|x| if x=="X" || x=="O"
  count +=1
end
}
count
end
def current_player
turn_count.even? ? "X" : "O"
end

 def turn
puts "Please enter your move (1-9): "
user_input=gets.strip
position=input_to_index(user_input)
if (valid_move?(position))
  token=current_player
  move(position,token)
  display_board
else
  turn
end
end
 def won?
   WIN_COMBINATIONS.detect do |x|
     @board[x[0]]==@board[x[1]] && @board[x[1]]==@board[x[2]] && (@board[x[0]]=="X" || @board[x[0]]=="O")
   end
 end

def full?
!(@board.include?("") || @board.include?(" "))
end

def draw?
full? && !won?
end

def over?
won? || draw? || full?
end

def winner
  if won?
    return @board[won?[0]]
  end
end

def play
until over?
  turn
end
if won?
  puts "Congratulations #{winner}!"

elsif draw?
  puts "Cat's Game!"
end
end

end
