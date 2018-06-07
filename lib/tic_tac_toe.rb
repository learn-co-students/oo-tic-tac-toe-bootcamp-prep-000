class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
   WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
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


def move(index, token="X")
  @board[index] = token
end

def position_taken?(index)
  if @board[index] == "X" || @board[index] == "O"
    return true
  else 
  return false 
end
end

def valid_move?(index)
  if index >= 0 && index <=9 && !position_taken?(index)
    return true
  else 
    return false
  end
end

def turn_count
  total = 0
  @board.each do |box|
    if box == "X" || box == "O"
      total += 1 
    end
  end
  return total
end

def current_player
  turns = turn_count
  if turns % 2 == 0 
    return "X"
  else 
    return "O"
end
end

def turn
  player = current_player
  puts "Enter your move 1-9"
  user_input = gets.strip
  index = input_to_index(user_input)
  if valid_move?(index)
    move(index, player)
    display_board
  else 
    turn
  end
end

def won?
  player = current_player
  WIN_COMBINATIONS.each do |combo|
    pl1 = combo[0]
    pl2 = combo[1]
    pl3 = combo[2]
    if @board[pl1] == @board[pl2] && @board[pl3] == @board[pl2] && @board[pl1] != " "
      return combo
    end
  end
  return false
end

def full?
  return @board.none? do |box|
    box == " "
  end
end

def draw?
  return full? && !won?
end

def over?
  if won? || draw?
    return true
end
end

def winner
  if won?
    wplace = won?[0]
    @board[wplace]
  else
    nil 
  end
end


def play
  display_board
  count = 1 
  until count == 10
  if over?
    handle_over
  else 
        turn
        if draw?
        end
end
  count +=1 
end 
end
end

def handle_over
  if draw? == true
    puts "Cat's Game!"
  else
    the_winner = winner
    puts "Congratulations #{the_winner}!"
end

end