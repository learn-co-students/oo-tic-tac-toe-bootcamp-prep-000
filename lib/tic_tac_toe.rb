class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2], # Top row 0
  [3,4,5], # Middle row 1
  [6,7,8], # Bottom row 2
  [0,3,6], # Column 1 3
  [1,4,7], # Column 2 4
  [2,5,8], # Column 3 5
  [0,4,8], # Back diagonal 6
  [2,4,6]  # Forward diagonal 7
  ]

  def initialize
    @board = Array.new(9, " ")
    @marker = "X"
  end

 def win_combinations
  WIN_COMBINATIONS
 end

  def board
    @board
  end

 def marker
  @marker
 end
  def input_to_index(input)
    input.to_i - 1
  end

  def index
    @index
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

  def move(index, marker)
    @board[index] = marker
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
  !position_taken?(index) && index.between?(0, 8)
    end

def turn_count
  @number_of_turns = 0
  @board.each do |count|
      if count == "X" || count == "O"
        @number_of_turns += 1
      end
    end
      return @number_of_turns
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

def turn
  puts "Please enter 1-9:"
  @input = gets.strip
  @index = input_to_index(@input)

  if valid_move?(index)
    move(index, current_player)
  else
    turn
  end
  display_board
end

  def won?
    win_combinations.detect do |value|
    @board[value[0]] == @board[value[1]] && @board[value[1]] == @board[value[2]] && position_taken?(value[0])
  end
  end

  def full?
    if @board.any?{|marker| marker == " "} 
    return false
  else
    return true
  end
  end

  def draw?
    if full? && won? == nil
    puts "Cat's Game!"
    return true
  else
    return false
  end
  end

  def over?
    won? || full?
  end

  def winner
    if won?
    puts "Congratulations #{@board[won?[0]]}!"
    return @board[won?[0]]
  else
    return nil
  end
  end  

  def play
  until over? || draw?
    turn
  end
  winner || draw?
end

end
