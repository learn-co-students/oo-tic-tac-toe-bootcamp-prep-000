class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #first column
    [1, 4, 7], #second column
    [2, 5, 8], #third column
    [0, 4, 8], #diagonal down
    [2, 4, 6]  #diagonal up
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def to_index(input)
    input.to_i - 1
  end

  def move(input, token = "X")
    @board[to_index(input)] = token
  end

  def position_taken?(index)
    @board[index] != " " ? true : false
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(to_index(input.to_i))
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    (0..8).count {|b| @board[b] != " "}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |c|
      (@board[c[0]] == "X" && @board[c[1]] == "X" && @board[c[2]] == "X") || (@board[c[0]] == "O" && @board[c[1]] == "O" && @board[c[2]] == "O")
    end
  end

  def full?
    @board.all? {|b| b == "X" || b == "O"}
  end

  def draw?
      full? && !won?
  end

  def over?
      won? || full?
  end

  def winner
    @board[won?[0]] if won?
  end

  def play
    until won? || draw? || over?
      turn
    end
      puts "Congratulations #{winner}!" if won?
      puts "Cats Game!" if draw?
  end
end
