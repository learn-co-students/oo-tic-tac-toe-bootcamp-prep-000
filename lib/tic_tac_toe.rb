class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  attr_reader :board

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    3.times do |row_idx|
      offset_idx = row_idx * 3
      puts " #{board[offset_idx]} | #{board[offset_idx + 1]} | "\
        "#{board[offset_idx + 2]} "
      puts "-" * (3 * 4 - 1) unless row_idx == 2
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token)
    board[index] = token
  end

  def position_taken?(index)
    board[index] != " "
  end

  def valid_move?(index)
    index.between?(0, board.count - 1) && !position_taken?(index)
  end

  def turn_count
    board.count { |token| token != " " }
  end

  def current_player
    turn_count.even? ? "X" : "O"
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

  def won?
    WIN_COMBINATIONS.detect do |combo|
      position_taken?(combo[0]) && board[combo[0]] == board[combo[1]] &&
        board[combo[1]] == board[combo[2]]
    end
  end

  def full?
    board.none? { |token| token == " " }
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    winning_combo = won?
    board[winning_combo[0]] if winning_combo
  end

  def play
    puts "Welcome to Tic Tac Toe!"
    display_board

    until over?
      turn
    end

    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
end
