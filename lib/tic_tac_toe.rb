
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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      position_taken?(win_combination[0]) && ( @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[0]] == @board[win_combination[2]] )
    end
  end

  def full?
    @board.all? do |i|
      !(i == " " || i == nil)
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = gets.strip
    index = input_to_index(index)
    if !valid_move?(index)
      turn
    end
    move(index, current_player)
    display_board
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def turn_count
    @board.count{|token| token=="X" || token == "O"}
  end

  def current_player
    turn_count.odd? ? "O" : "X"
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # code your input_to_index and move method here!
  def move(index, character)
    @board[index] = character
  end

  def input_to_index(user_input)
    user_input.to_i - 1
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
