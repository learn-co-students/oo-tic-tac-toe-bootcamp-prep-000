class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(position)
    if @board[position] == "X" || @board[position] == "O"
      return true
    end
    false
  end

  def valid_move?(position)
    if position.between?(0, 9) && position_taken?(position) == false
      return true
    end
    false
  end

  def turn
    puts "Choose a position between 1-9"
    input = gets.chomp
    position = input_to_index(input)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |position|
      if position == "X" || position == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    count = turn_count
    if count % 2 == 0
      return "X"
    end
    "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      winning_line = []
      combination.each do |index|
        winning_line << @board[index]
      end
      x_win = winning_line.all? do |symbol|
        symbol == "X"
      end

      o_win = winning_line.all? do |symbol|
        symbol == "O"
      end

      if x_win || o_win
        return combination
      end
    end
    false
  end

  def full?
    @board.none? do |position|
      position == " "
    end
  end

  def draw?
    if full? && !won?
      return true
    end
    false
  end

  def over?
    if won? || draw?
      return true
    end
    false
  end

  def winner
    if won?
      return @board[won?[0]]
    end
    nil
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
