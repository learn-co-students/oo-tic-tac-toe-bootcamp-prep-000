class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
end

def move(index, token)
  @board[index] = token
end
def position_taken?(index)
  if @board[index] == "" || @board[index] == " " || @board[index] == nil
    return false
  else
    return true
  end
end
def valid_move?(index)
  !position_taken?(index) && index.between?(0,8)
end
def turn
  puts "Please put 1-9"
  input = gets.strip
  input_to_index(input)
  if valid_move?(index)
    move(index, token)
    display_board
  else
    turn
  end
end
def turn_count
  count = 0
  @board.each do |i|
    if i == "X" || i == "O"
      count += 1
    end
  end
  count
end
end
