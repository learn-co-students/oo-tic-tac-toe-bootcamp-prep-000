class TicTacToe

def initialize(board = nil)
  @board = board || Array.new(9, " ")
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

def input_to_index(str)
  return str.to_i-1
end

def move(index, player)
  @board[index] = player
end

def position_taken?(index)
  if @board[index] != " "
      return true
  end
  return false
end

def valid_move?(index)
  if (index > -1 && index < 9)
    if (position_taken?(index) == false)
      return true
    end
  else
    return nil
  end
end

def turn
  puts "Please enter a number between 1-9:"
  input = input_to_index(gets.strip)
  if valid_move?(input)
    move(input, current_player)
    display_board
  else
    turn
  end
end

def turn_count
  @board.count{|token| token == "X" || token == "O"}
end

def current_player
  turn_count % 2 == 0 ? "X" : "O"
end

def display_board
 puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
 puts "-----------"
 puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
 puts "-----------"
 puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def won?
    WIN_COMBINATIONS.each do |wincombo|
      if @board[wincombo[0]] == "X" && @board[wincombo[1]] == "X" && @board[wincombo[2]] == "X"
        return wincombo
      elsif @board[wincombo[0]] == "O" && @board[wincombo[1]] == "O" && @board[wincombo[2]] == "O"
        return wincombo
      end
    end
  return false
end


def full?
  @board.all? {|pos| pos == "X" || pos == "O"}
end

def draw?
    if won?
      return false
    end
    if full?
      return true
    else
      return false
    end
end

def over?
  if draw?
    return true
  elsif won?
    return true
  else
    return false
  end
end

def winner
    WIN_COMBINATIONS.each do |wincombo|
      if @board[wincombo[0]] == "X" && @board[wincombo[1]] == "X" && @board[wincombo[2]] == "X"
        return "X"
      elsif @board[wincombo[0]] == "O" && @board[wincombo[1]] == "O" && @board[wincombo[2]] == "O"
        return "O"
      end
    end
  return nil
end

def play
  until over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat\'s Game!"
  end
end

end
