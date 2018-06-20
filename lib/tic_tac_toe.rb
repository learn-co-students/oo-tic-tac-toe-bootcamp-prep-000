class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]]

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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    (@board[index] == " " || @board[index] == "" || @board[index] == nil) ? false : true
  end

  def valid_move?(index)
    (position_taken?(index) == false && index.between?(0, 8)) ? true : false
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

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    (turn_count % 2 == 0) ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |position|
      if @board[position[0]] == "X" && @board[position[1]] == "X" && @board[position[2]] == "X"
        position
      elsif @board[position[0]] == "O" && @board[position[1]] == "O" && @board[position[2]] == "O"
        position
      else
        false
      end
    end
  end

  def full?
    @board.all? {|token| token == "X"||token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    won?.class != Array ? nil : @board[won?[0]]
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
