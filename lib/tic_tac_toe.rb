class TicTacToe

  WIN_COMBINATIONS = [
    [1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9] [3,5,7]
  ]

  def initialize(board = nil)
    @board = board || array.new(9, " ")
  end

  def display_board
    lines = "-----------"

    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts lines
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts lines
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
    board[index] = current_player
  end

  def position_taken?(index)
    board[index].include?("X") || board[index].include?("Y")
  end

  def valid_move?(index)
    index >= 0 && index <= 8 && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9"
    user_move = input_to_index(gets.strip)
    if valid_move?(user_move)
      move()

  end

  def turn_count
    (board.select { |position| position == "X" }.append(board.select { |position| position == "Y" })).length

    }

  end

  def current_player?

  end











end
