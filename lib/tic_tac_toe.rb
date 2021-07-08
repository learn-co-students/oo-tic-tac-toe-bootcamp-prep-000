class TicTacToe

def initialize
  @board = Array.new(9," ")
end

WIN_COMBINATIONS = [
  #rows
  [0,1,2],
  [3,4,5],
  [6,7,8],
  #columns
  [0,3,6],
  [1,4,7],
  [2,5,8],
  #diagonals
  [0,4,8],
  [2,4,6]
]

def display_board()
  line = ""
  11.times {line = line + "-"}
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts line
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts line
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(index)
  @index = index.to_i - 1
  return @index
end

def move(index, player = "X")
  @board[index] = player
end

def position_taken?(index)
  return !(@board[index].nil? || @board[index] == " ")
end

def valid_move?(index)
  return !(index < 0 || index > 8 || position_taken?(index))
end

def turn_count()
  counter = 0
  @board.each do |place|
      if place != " "
        counter += 1
      end
  end
  return counter
end

def current_player()
  if turn_count() % 2 == 0
    return "X"
  else
    return "O"
  end
end

def turn()
  puts "Please enter 1-9:"
  index = gets.strip
  index = input_to_index(index)
  if valid_move?(index)
      move(index, current_player())
      display_board()
  else
     turn()
  end
end

def won?()
  winner = false
  WIN_COMBINATIONS.each do |combo|
    if @board[combo[0]] == @board[combo[1]] &&  @board[combo[1]] == @board[combo[2]] && position_taken?(combo[0])
        winner = combo
    end
  end
  return winner
end

def full?()
  @board.none? do |place|
    place == " "
  end
end

def draw?()
  return !won?() && full?()
end

def over?()
  return won?() || draw?()
end

def winner()
  if won?() == false
    return nil
  else
    winning_combo = won?()
  return @board[winning_combo[0]]
  end

end

def play()
    until over?()
      turn()
    end
  
    if draw?()
      puts "Cat's Game!"
    elsif !!won?()
      winner = winner()
      puts "Congratulations #{winner}!"
    end
end

end
