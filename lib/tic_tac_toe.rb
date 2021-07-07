class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end
   WIN_COMBINATIONS =[
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
   user_input.to_i - 1
  end
  
  def move (index,char = "X")
  @board[index] = char
  end
  
  def position_taken? (index)
  taken = nil
  if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
    taken = false
  else
    taken = true
  end
end

def valid_move?(index)
  if (index.between?(0,8) && !position_taken?(index))
    true
  else
    false
  end
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
    answer = input_to_index(input)
    if valid_move?(answer)
      move(answer,current_player)
      display_board
  else
    puts "Invalid Entry!"
    turn
  end  
end

def turn_count
  counter = 0
@board.each do |space|
  if space == "X" || space == "O"
    counter += 1
  end
  end
  return counter
end

def current_player
  if turn_count % 2 ==0
    current_player = "X"
  else
    current_player = "O"
  end
return current_player
end

def won?
  WIN_COMBINATIONS.each do |combo| 
  if @board[combo[0]] != " " && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
    return combo
  end
  end
  return false
end

def full? 
  if @board.detect { |i| i == " " }
    return false
  else 
    return true
  end
end

def draw?
  if !won? && full?
    return true
    puts "Cat's Game!"
  else
    return false 
  end
end

def over?
  if won? || draw? || full?
    return true
  else
    return false
  end
end

def winner 
  game_winner = won?
  if game_winner 
    @board[game_winner[0]]
  end
 end
 
 def play
  until over?
current_player
turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end
end