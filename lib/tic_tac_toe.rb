class TicTacToe
  def initialize
    @board = [ " ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0, 8)
  end

  def turn_count
    turn_counter = @board.count {|space| space != " " && space != ""}
  end

  def current_player
    if turn_count % 2 == 0
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
      token = current_player
      move(index, token)
    else
      turn
    end
  display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board[combination[0]] == @board[combination[1]] &&
      @board[combination[1]] == @board[combination[2]] &&
      position_taken?(combination[0]) &&
      position_taken?(combination[1]) &&
      position_taken?(combination[2])
    end
  end

  def full?
    @board.all? {|space| space == "X" || space == "O"}
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || full? || draw?
      true
    end
  end

  def winner
    if won?
      winning_board = won?
      return @board[winning_board.first]
    else
      nil
    end
  end

  def play
    while !over?
      turn
    end
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end


end
