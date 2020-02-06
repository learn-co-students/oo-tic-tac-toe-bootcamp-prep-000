class TicTacToe
  def initialize
    @board = Array.new(9," ")
 end
  WIN_COMBINATIONS = [
    [0,1,2], # Top Row
    [3,4,5], # Middle Row
    [6,7,8], # Bottom Row
    [0,3,6], # Left Column
    [1,4,7], # Middle Column
    [2,5,8], # Right Column
    [0,4,8], #Left Diagonal
    [6,4,2]  #Right Diagonal
  ]

    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
      puts "-----------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
      puts "-----------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
      puts "-----------"
  end

  def input_to_index(string)
    string.to_i - 1
  end

def move(position,player = "X")
  @board[position] = player
end

def position_taken?(position)
  @board[position].include?("X") ||
  @board[position].include?("O")
end

def valid_move?(position)
   position >= 0 && position < 9 && !position_taken?(position)
end

def turn_count
  @board.reject {|count| count == " " }.length
end

def current_player
  turn_count.even? ? "X" : "O"
end

def turn
  loop do
    puts "Enter position (1-9)"
    position = input_to_index(gets.strip)
    if valid_move?(position)
      move(position,current_player)
      display_board
      break
    end
  end
end

def won?
 won = nil
  WIN_COMBINATIONS.each do |indexes|
    if  @board[indexes[0]] == @board[indexes[1]] &&
        @board[indexes[1]] == @board[indexes[2]] &&
        @board[indexes[0]] != " "
      won = indexes
      break
    end
  end
  won
end

def full?
  !@board.include?" "
end

def draw?
  !won? && full?
end

def over?
  won? || draw?
end

def winner
  winner = won?
  winner ? @board[winner[0]] : nil
end

def play
until over?
  turn
 end
 won? ? (puts "Congratulations #{winner}!") : (puts "Cat's Game!")
 end
end
