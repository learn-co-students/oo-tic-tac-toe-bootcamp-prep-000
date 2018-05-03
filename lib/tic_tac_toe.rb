class TicTacToe

  def initialize(board = Array.new(9, " "))
    @board = board
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
    index = input.to_i - 1
  end

  def move(index, character="X")
    @board[index] = character
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      return false
    else
      return true
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    end
  end

  def turn
    character = current_player
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, character)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |winc|
      @board[winc[0]] == @board[winc[1]] &&
      @board[winc[1]] == @board[winc[2]] &&
      (@board[winc[0]] == "X" || @board[winc[0]] == "O")
    end
  end

  def full?
    @board.all? do |fullb|
      fullb == "X" || fullb == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if WIN_COMBINATIONS.detect do |winc|
      @board[winc[0]] == @board[winc[1]] &&
      @board[winc[1]] == @board[winc[2]] &&
      @board[winc[0]] == "X"
      end
      "X"
    elsif WIN_COMBINATIONS.detect do |winc|
      @board[winc[0]] == @board[winc[1]] &&
      @board[winc[1]] == @board[winc[2]] &&
      @board[winc[0]] == "O"
      end
      "O"
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!"
    end
  end

end
