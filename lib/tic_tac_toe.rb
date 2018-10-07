class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
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
    b = @board
    line = "-----------"
    puts(" #{b[0]} | #{b[1]} | #{b[2]} ")
    puts(line)
    puts(" #{b[3]} | #{b[4]} | #{b[5]} ")
    puts(line)
    puts(" #{b[6]} | #{b[7]} | #{b[8]} ")
  end

  def input_to_index(i)
    i.to_i - 1
  end

  def move(index, char)
    @board[index] = char
  end

  def valid_move? (index)
    return index.between?(0, @board.size) && !position_taken?(index)
  end

  def turn
    puts("Please enter 1-9:")
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |spot|
      counter += (spot != " " && spot !="") ? 1 : 0
    end
    return counter
  end

  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end

  def play
    until over?
      turn
    end
    if win = winner
      puts("Congratulations #{win}!")
    elsif draw?
      puts("Cat's Game!")
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |winRow|
      winRow.all? {|spot| @board[spot] == "X"} || winRow.all? {|spot| @board[spot] == "O"}
    end
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    return full? && !won?
  end

  def over?
    return draw? || won?
  end

  def winner
    if win = won?
      return @board[win[0]]
    end
  end
end
