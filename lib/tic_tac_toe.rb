class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5],
    [6,7,8],
    [0,3,6], #first col
    [1,4,7],
    [2,5,8],
    [0,4,8], #diag
    [2,4,6]
  ]

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

  def move(index, curr_player = "X")
    @board[index] = curr_player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      curr_player = current_player
      move(index, curr_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
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

  def won?
    WIN_COMBINATIONS.each do |combination|
      if ((@board[combination[0]] == @board[combination[1]]) && (@board[combination[1]] == @board[combination[2]]) && (@board[combination[0]] != " "))
        return combination
      end
    end
    return false
  end

  def full?
    if @board.any? { |pos| pos == " "}
      return false
    end
    true
  end

  def draw?
    if won? == false && full? == true
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
    winning_combo = won?
    if winning_combo.kind_of?(Array)
      return @board[winning_combo[0]]
    end
    nil
  end

  def play
    while over? == false
      turn
    end
    if won? != false
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
