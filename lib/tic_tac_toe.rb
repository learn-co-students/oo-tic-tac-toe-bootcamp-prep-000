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

def input_to_index(position)
  position.to_i - 1
end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, token = "X")
    index = input_to_index(index)
    @board[index] = token
  end

  def position_taken?(position)
    !(@board[position] == " " || @board[position] == "" || @board[position].nil?)
  end

  def valid_move?(index)
      index = input_to_index(index)
      !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    token = turn_count
      if valid_move?(user_input)
         move(user_input, token)
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

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if   (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X")  ||
           (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
      return win_combo
    else
      return false
      end
    end
  end

  def full?
    @board.each{|a| a == ("X" || "O")}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
      return @board[win_combo[0]]
  end

  def play
    if !over?
      turn
    elsif draw?
      puts "Cats game!"
    else
      puts "Congratulations " + winner + "!"
    end
  end

end
