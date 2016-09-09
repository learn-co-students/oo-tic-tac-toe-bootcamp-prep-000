class TicTacToe
  attr_accessor :board

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # first column
    [1,4,7], # middle column
    [2,5,8], # last column
    [0,4,8], # left diagonal
    [2,4,6] # right diagonal
  ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
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

  def move(user_input, token = "X")
    board[user_input.to_i - 1] = token
  end

  def position(square)
    board[square.to_i]
  end

  def position_taken?(square)
    !(position(square).nil? || position(square) == " ")
  end

  def valid_move?(user_input)
    user_input.to_i.between?(1,9) && !position_taken?(user_input.to_i - 1)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip

    if !valid_move?(input)
      turn
    end

    move(input, current_player)
    display_board
  end

  def turn_count
    board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      position(combo[0]) == position(combo[1]) && position(combo[1]) == position(combo[2]) && position_taken?(combo[0])
    end
  end

  def full?
    board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if winning_combo = won?
      position(winning_combo.first)
    end
  end

end
