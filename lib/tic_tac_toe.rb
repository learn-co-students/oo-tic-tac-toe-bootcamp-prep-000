class TicTacToe
  def initialize()
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
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(index, player)
    @board[index.to_i - 1] = player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index = index.to_i - 1
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      character = current_player
      move(input, character)
      display_board
    else
      puts "Wrong move!"
      turn
    end
  end

  def turn_count
    @board.count {|character| character == "X" || character == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
      return WIN_COMBINATIONS.find{|comb|
        ((comb.all?{|n| @board[n] == "X"}) || (comb.all?{|n| @board[n] == "O"}))}
  end

  def full?
    @board.all?{|character| character == "X" || character == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combo = won?
      @board[win_combo.first]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
