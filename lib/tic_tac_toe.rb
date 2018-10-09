class TicTacToe 
  def initialize(board = [" "," "," "," "," "," "," "," "," "] )
    @board = board
  end 
  
  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 4, 8],
  [2, 4, 6],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
      actual = input.to_i - 1
      actual
  end
  
  def move(pos, char)
    @board[pos] = char
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
   num = (0..8).to_a
  if num.include?(index)
    return true unless position_taken?(index)
  end
    false
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      char = current_player
      move(index, char)
      display_board
    else
      turn
    end
  end

def current_player
  turn = turn_count
  if turn.odd?
    return "O"
  else
    return "X"
  end
end 
  
  def turn_count
    occupied = 0
    @board.each { |el| occupied += 1 unless el == " "}
    occupied
  end
  
  def won?
    WIN_COMBINATIONS.each do |pos|
      return pos if @board[pos[0]] == "X" && @board[pos[1]] == "X" && @board[pos[2]] == "X"
      return pos if @board[pos[0]] == "O" && @board[pos[1]] == "O" && @board[pos[2]] == "O"
    end
   return nil if full?
  end
  
  def full?
    @board.all?{ |el| el != " "}
  end
  
  def draw?
   return false if full? && won?
   return false unless full?
   true
  end

  def over?
    return true if draw?
    return true if won?
  end

  def winner
    if won?
     pos = won?
     return @board[pos[0]]
    else
     return nil
    end
  end

  def play
    until over? || full?
      turn
    end
    puts "Cat's Game!" if draw?
    puts "Congratulations #{winner}!" if won?
  end 
end  
