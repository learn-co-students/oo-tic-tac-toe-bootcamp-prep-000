class TicTacToe
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

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    divider = ''
    11.times { divider += '-' }

    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts divider
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts divider
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i-1
  end

  def move(i, char)
    @board[i] = char
  end

  def position_taken?(i)
    !(@board[i] == " ")
  end

  def valid_move?(i)
    i.between?(0, 8) && !position_taken?(i)
  end

  def turn_count
    @board.select { |cell| cell != " " }.size
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Enter a number 1-9:"
    where = input_to_index(gets.strip)

    if valid_move?(where)
      move(where, current_player)
      display_board
    else
      turn
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
    @board.all? { |cell| cell != " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    @board[won?[0]] if won?
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
