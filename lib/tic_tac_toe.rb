class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    # Rows
    [0,1,2],
    [3,4,5],
    [6,7,8],
    # Columns
    [0,3,6],
    [1,4,7],
    [2,5,8],
    # Diagionals
    [0,4,8],
    [2,4,6],
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

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      player = current_player
      move(index, player)
    else
      turn
    end
    puts display_board
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_0 = win_combination[0]
      win_index_1 = win_combination[1]
      win_index_2 = win_combination[2]

      position_0 = @board[win_index_0]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]

      if position_0 == position_1 && position_1 == position_2 && position_taken?(win_index_0)
        return win_combination
      end
    end
    false
  end

  def full?
    @board.none? {|index| index == nil || index == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    win_combination = won?
    if win_combination
      win_location = win_combination[0]
      return @board[win_location]
    end
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
