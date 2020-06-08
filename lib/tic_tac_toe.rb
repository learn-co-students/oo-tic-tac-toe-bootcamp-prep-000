class TicTacToe
  def initialize(board = nil)
   @board = board || Array.new(9, " ")
 end

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

def move( index, token)
  #current_player = "X"
  @board[index] = token
end

def valid_move?( index)
  index.between?(0,8) && !position_taken?( index)
end

def turn
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?( index)
    move(index, current_player)
    display_board
  else
    turn
  end
end

def turn_count
      @board.count("O") + @board.count("X")
end

def current_player
 turn_count.odd? ? "O" : "X"
end

def position_taken?( index)  #Helper Method
  !(@board[index].nil? || @board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # 1st column
  [1,4,7], # 2nd column
  [2,5,8], # 3rd column
  [0,4,8], # diagonal one
  [2,4,6]  # diagonal two
]

def won?
  WIN_COMBINATIONS.find do |win_combination|
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  @board[win_combination[0]] == @board[win_combination[1]] &&
  @board[win_combination[1]] == @board[win_combination[2]] &&
  position_taken?(win_combination[0])
end
end

def full?
   @board.all? {|token| token== "X"|| token== "O"}
  end

def draw?
   full? && !won?
end

def over?
   won? || full?
end

def winner
 if win_row = won?
  @board[win_row[0]]
end
end

def play
    until over?|| draw?
       turn
    end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end


  end
