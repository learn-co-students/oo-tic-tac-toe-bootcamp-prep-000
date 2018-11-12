class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
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

def move(index, player_token)
  @board[index] = player_token
end

def position_taken?(location)
  if @board[location] === "X" || @board[location] === "O"
    return true
  end
  return false
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
  number_of_turns_played = 0
  
  @board.each do |ele|
    if ele == "X" || ele == "O"
      number_of_turns_played += 1
    end
  end
  
  return number_of_turns_played
end

def current_player
 turn_count % 2 == 0 ? "X":"O"
end

def won?
  WIN_COMBINATIONS.each do |combo|
    if combo.all? { |index| @board[index] == "X"}
      return combo
    elsif combo.all? { |index| @board[index] == "O"}
      return combo
    end
  end
  return false
end

def full?
  @board.each do |ele|
    if ele == " "
      return false
    end
  end
  return true
end

def draw?
  if full? && !won?
    return true
  end
  
  return false
end

def over?
  if won? || draw? || full?
    return true
  end
end

def winner
  if isWinner = won?
    return @board[isWinner[0]]
  end
end

def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  end
  if draw?
    puts "Cat's Game!"
  end
end

end
