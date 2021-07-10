class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index] == nil)
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    count = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |array|
      if array.all? { |cell| @board[cell] == "X"} || array.all? { |cell| @board[cell] == "O"}
        return array
      end
    end
    false
  end

  def full?
    @board.all? { |cell| cell == "X" || cell == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    if over? && won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
