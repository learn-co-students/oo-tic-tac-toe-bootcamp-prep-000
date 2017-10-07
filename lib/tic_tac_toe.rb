class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # 1st column
  [1,4,7], # 2nd column
  [2,5,8], # 3rd column
  [0,4,8], # diagonal top left to bottom right
  [2,4,6]  # other diagonal!
]
  def initialize(board = nil)
      @board = board || Array.new(9, " ")
  end
  def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5] } "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8] } "
  end
  def input_to_index(input)
    @input = input.to_i - 1
  end
  def move(move, player = "X")
      @board[move] = player
  end
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end
  def position_taken?(index)
  if @board[index] == " " || @board[index] == "" || @board[index] == nil
    false
  elsif @board[index] == "X" || @board[index] == "O"
    true
  end
end
  def valid_move?(index)
  if index.between?(0,8) && !position_taken?(index)
    true
  else false
  end
end

def turn
#  player = current_player # asssume player is X
  puts "Please enter 1-9:"
  input = gets.strip
  @index = input_to_index(input)
  while !valid_move?(@index) do
    input = gets.strip
    @index = input_to_index(input)
  end
  move(@index,current_player)
  display_board
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  count = 0
@board.each do |index|
if index == "X" || index =="O"
  count += 1
end
end
return count
end

def won?
  WIN_COMBINATIONS.each do |combination|
    pos1 = combination[0]
    pos2 = combination[1]
    pos3 = combination[2]
    if (@board[pos1] == "X" && @board[pos2] =="X" && @board[pos3] =="X") || (@board[pos1] == "O" && @board[pos2] =="O" && @board[pos3] =="O")
      return combination
    end
    end
    return false # because will only get here if have not "returned" due to finding a win combination
  end

  def full?
    @board.all?{|i| i == "X" || i =="O"}
  end

  def draw?
    full? && !won?
    end

    def over?
      won? || draw? ||full?
    end

    def winner
      winning_player = won?
      if winning_player == false
        return nil
      else @board[winning_player[0]] # simply access the first element of the winning combination
      end
    end

    def play
      until over?
        turn
      end
    # check for winner
    if winner
      puts "Congratulations #{winner}!"
    elsif draw?
    puts "Cat's Game!"
    end
    end

end
