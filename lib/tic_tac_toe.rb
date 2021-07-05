class TicTacToe
  def initialize()
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Bottom row
    [0,3,6],  # left column
    [1,4,7], # middle column
    [2,5,8],  # right column
    [0,4,8], # diagonal one
    [2,4,6]  # diagonal two
  ]

  def display_board()
  puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position, character)
    @board[position] = character
  end

  def position_taken?(index)
  if @board[index] == " "
    false
  elsif @board[index] == "X" || @board[index] == "O"
    true
  end
end

def valid_move?(index)
  taken = position_taken?(index)

  if index.between?(0,8) && !taken
    true
  else
    false
  end
end

def turn()
  puts "Please enter 1-9:"
  input = gets.chomp
  position = input_to_index(input)
  valid = valid_move?(position)
  if !valid
    turn()
  else
    character = current_player()
    move(position,character)
    display_board()
  end
end

def turn_count()
  counter = 0

  @board.each do |index|
    if index == "X" || index == "O"
      counter += 1
    end
  end
  return counter
end

def current_player()
  if turn_count() % 2 == 0
    "X"
  else
    "O"
  end
end

def won?()
  WIN_COMBINATIONS.each do |win_array|
    all_items = win_array.all? do |index|
      position_taken?(index) && @board[index] == "X"
    end
    if all_items
      return win_array
    else
      all_items = win_array.all? do |index|
        position_taken?(index) && @board[index] == "O"
    end
    if all_items
      return win_array
    end
   end
  end
   return false
end

def full?()
  index = [0,1,2,3,4,5,6,7,8]
  index.all? { |index| position_taken?(index) }
end

def draw?()
  if !won?() && full?()
    return true
  end
end

def over?()
  if won?() || draw?() || full?()
    return true
  end
end

def winner()
  if won?()
    array = won?()
    return @board[array[0]]
  end
 end

 def play()
   while !over?()
     turn()
   end
   if over?() && won?()
     puts "Congratulations " + winner() + "!"
   elsif over?() && draw?()
     puts "Cat's Game!"
   end
 end

end
