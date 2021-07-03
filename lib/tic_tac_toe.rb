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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    index = input_to_index(index)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index = input_to_index(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip.to_i
    if valid_move?(input)
      puts "Please enter 1-9:"
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|space| space == "X" || space == "O"}
  end

  def won?
    WIN_COMBINATIONS.detect do |i|
      @board[i[0]] == @board[i[1]] && @board[i[1]] == @board[i[2]] && position_taken?(i[0])
    end
  end

  def full?
    @board.all? { |i| i == 'X' || i == 'O'}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if win = won?
      @board[win.first]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end
end
