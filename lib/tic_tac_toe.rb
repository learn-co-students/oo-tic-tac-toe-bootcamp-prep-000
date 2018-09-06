class TicTacToe
  def initialize(board = [" ", " "," "," "," "," "," "," "," "])
    @board = board
  end
  
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
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
  space = (user_input.to_i) - 1
  end
  
  def move(space, character = "X")
  @board[space] = character
  return @board
  end
  
  def position_taken?(space)
  if @board[space] == "X" || @board[space] == "O"
    return true
  else
    return false
  end
  end
  
  def valid_move?(space)
  if !position_taken?(space) && space.between?(0, 8)
    return true
  else
    return false
  end
end

  def turn
  puts "Please enter 1-9:"
  user_input = gets.strip
  space = input_to_index(user_input)
  character = current_player
    if valid_move?(space)
      move(space, character)
      display_board
    else
      puts "Invalid Move"
      turn
    end
  end

  def turn_count
  count = 0
  @board.each do |space|
    if space == "X" || space == "O"
    count += 1
    end
  end
  return count
end

  def current_player
  if turn_count % 2 == 0 
    character = "X"
  else
    character = "O"
  end
end

  def won?
  WIN_COMBINATIONS.find do |condition|
  win_index_1 = condition[0]
  win_index_2 = condition[1]
  win_index_3 = condition[2]
  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return condition
    end
  end
end

def full?
  @board.all? do |square|
    square == "X" || square == "O"
  end
end

def draw?
  if !won? && full?
    return true
  end
end

def over?
  if won? || draw?
    return true
  end
end

def winner
  if won?.class == Array
   @board[won?[0]]
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