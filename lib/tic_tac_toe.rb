class TicTacToe
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [6, 4, 2]]

def display_board()
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(user_input)
  if user_input.to_i.to_s != user_input
    -1
  else
    user_input.to_i - 1
  end
end

def move(index, char)
  @board[index] = char
end

def position_taken?(position)
  (@board[position] == "X" || @board[position] == "O")?
  true : false
end

def valid_move?(position)
  if position_taken?(position) || position < 0 || position > 8
    false
  else
    true
  end
end

def turn()
  puts "input: "
  index = input_to_index(gets.strip)
  while !valid_move?(index)
    puts 'input: '
    index = input_to_index(gets.strip)
  end
  char = current_player()
  move(index, char)
  display_board()
end

def turn_count()
  count = 0
  @board.each do |element|
    if element == 'X' || element == 'O'
      count += 1
    end
  end
  count
end

def current_player()
  (turn_count() % 2 == 0)?
  'X' : 'O'
end

def won?()
  WIN_COMBINATIONS.each do |win|
    if @board[win[0]] == 'X' && @board[win[1]] == 'X' && @board[win[2]] == 'X'
      return win
    elsif @board[win[0]] == 'O' && @board[win[1]] == 'O' && @board[win[2]] == 'O'
      return win
    end
  end
  false
end

def full?()
  if turn_count() == 9 && !won?()
    true
  elsif turn_count() < 9 && !won?()
    false
  end
end

def draw?()
  if full?()
    true
  else
    false
  end
end

def over?()
  if draw?() || won?()
    true
  else
    false
  end
end

def winner()
  WIN_COMBINATIONS.each do |win|
    if @board[win[0]] == 'X' && @board[win[1]] == 'X' && @board[win[2]] == 'X'
      return "X"
    elsif @board[win[0]] == 'O' && @board[win[1]] == 'O' && @board[win[2]] == 'O'
      return "O"
    end
  end
  return nil
end

def play()
  while !over?()
    turn()
  end
  if won?()
    winner = winner()
    puts "Congratulations #{winner}!"
  elsif draw?()
    puts "Cat's Game!"
  end
end
end
