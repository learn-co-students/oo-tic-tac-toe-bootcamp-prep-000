class TicTacToe
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def play
  while(!over?)
      turn
    end
  if(winner)
    puts "Congratulations #{winner}!"
  else
    puts "Cat's Game!"
  end
end


def winner
  if over?
    if won?
      winner = board[won?[0]]
    end
  else
    nil
  end
end

def over?
  if draw? || won?
    return true
  else
    return false
  end
end

def draw?
  if won? == false
    if full?
      return true
    end
  end
end

def full?
  return board.none?{|i| i == " "}
end

def won?
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    #binding.pry
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return win_combination
    end
  end
  return false
end

def turn
  puts "Please enter 1-9:"
  input = gets.chomp
  index = input_to_index(input)
  if(valid_move?(index))
    move(index,current_player)
    display_board
  else
    turn
  end
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def turn_count
  move = 0
  board.each do |player|
    if(player == "X" || player == "O")
      move += 1
    end
  end
  move
end

def valid_move?(index)
  if (!position_taken?(index))
    if index.between?(0, 8)
      true
    else
      false
    end
  elsif (position_taken?(index))
      return false
  end
end

def position_taken?(index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

def move(index, character = "X")
  board[index] = character
end

def input_to_index(input)
  input.to_i - 1;
end

def display_board
  line = "-----------"
  puts(" #{board[0]} | #{board[1]} | #{board[2]} ")
  puts("#{line}")
  puts(" #{board[3]} | #{board[4]} | #{board[5]} ")
  puts("#{line}")
  puts(" #{board[6]} | #{board[7]} | #{board[8]} ")
end

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def board=(board)
    @board=board
  end

  def board
    @board
  end










end
