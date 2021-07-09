class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  WIN_COMBINATIONS =[
[0,1,2], # Top Row
[3,4,5], # Middle row
[6,7,8], # Bottom row
[0,3,6], # 1st collumn
[1,4,7], # 2nd collumn
[2,5,8], # 3rd collumn
[0,4,8], # R diagonal
[2,4,6]  # L diagonal
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

def move(index, current_player)
  @board[index] = current_player
end

def position_taken?(location)
  @board[location] != " " && @board[location] != ""
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
turn_counter = 0
@board.each do |position|
  if position == "X" || position == "O"
    turn_counter += 1
  end
end
  turn_counter
end

def current_player
  turn = turn_count
  if turn % 2 == 0
    return "X"
  else
    return "O"
  end
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = @board[win_index_1]
        position_2 = @board[win_index_2]
        position_3 = @board[win_index_3]
        if position_1 == "X" && position_2 =="X" && position_3 == "X" ||
          position_1 == "O" && position_2 =="O" && position_3 == "O"
        return win_combination
        end
  end
    return false
end

def full?
  @board.all? do |player|
    player == "X" || player =="O"
  end
end

def draw?
full? && !won?
end

def over?
 won? || draw? || full?
end

def winner
  if win_combination = won?
    @board[win_combination[0]]
  end
end

def play
  until over? do
    turn
  end
  player = winner
  if player != nil
  puts "Congratulations #{player}!"
  else
    puts "Cat's Game!"
  end
  end
end
