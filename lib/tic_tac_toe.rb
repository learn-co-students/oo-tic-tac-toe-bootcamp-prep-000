# Notes: #move & #valid_move? both convert the player position to its index number because
# the test suite submitted the position and not the index.
# In the procedural version of this game, the position was converted to an index
# before sending along to #move/#valid_move. Sneaking suspicion
# this inconsistancy could trip me up down the line.

class TicTacToe
  WIN_COMBINATIONS = [
    # Horizonal wins
    [0,1,2],
    [3,4,5],
    [6,7,8],
    # Vertical wins
    [0,3,6],
    [1,4,7],
    [2,5,8],
    # Diagonal wins
    [0,4,8],
    [2,4,6]
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

  def move(position, current_player)
    index = position.to_i - 1
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " "
  end

  def valid_move?(position)
    index = position.to_i - 1
    index.between?(0,8) && !position_taken?(index)
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
    turn = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
        turn += 1
      end
    end
    turn
  end

  def current_player
    if turn_count.odd?
      current_player = "O"
    else
      current_player = "X"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.none? {|i| i == " " }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    until over?
      turn
    end
    if draw?
        puts "Cats Game!"
    elsif won?
        puts "Congratulations #{winner}!"
    end
  end

end
