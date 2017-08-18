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
     [6,4,2]
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
    move(index, current_player())
    display_board()
  else
    turn()
  end
end

def turn_count
  count = 0
  @board.each do |place|
    if (place == "X" || place == "O")
      count +=1
    end
  end
  count
end

def current_player
  (turn_count() % 2 == 0)? "X": "O"
end

def won?
  win_comb = []
  WIN_COMBINATIONS.each do |combo|
    if position_taken?(combo[0])
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        win_comb = combo
      end
    end
  end
  if win_comb != []
    return win_comb
  else
    return false
  end
end

def full?
  @board.all? {|space| space == "X" || space == "O"}
end

def draw?
  if full?() && !won?()
    return true
  else
    return false
  end
end

def over?
  if won?() || draw?()
    return true
  else
    return false
  end
end

def winner
  winner = won?()
  if winner
    return @board[winner[0]]
  else
    return nil
  end
end

def play
  until over?()
    turn()
  end
  if winner() != nil
      puts "Congratulations #{winner()}!"
  elsif over?()
      puts "Cat's Game!"
  end
end
end
