class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #left column
  [1,4,7], #middle column
  [2,5,8], #right column
  [0,4,8], #l-r diagonal
  [2,4,6] #r-l diagonal
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

  def move (index, current_player="X")
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Player #{current_player}: Pick a space (number 1-9)"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "That move is invalid. Please try again."
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif winner.nil?
      puts "Cat's Game!"
    end
  end

  def won?
    WIN_COMBINATIONS.find do |possible_win|
      possible_win.all? do |possible_win_value|
        @board[possible_win_value] == "X"
      end ||
      possible_win.all? do |possible_win_value|
        @board[possible_win_value] == "O"
      end
    end
  end

  def full?
    @board.all? do |space|
      space == "X" || space == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
    who_won = won?
    return @board[who_won[0]]
    end
  end

end
