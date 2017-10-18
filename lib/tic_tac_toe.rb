class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Down diagonal
    [2,4,6]  # Up diagonal
  ]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    !!@board[index] && @board[index] != "" && @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
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
    num_turns = 0

    @board.each do |member|
      if member == "X" || member == "O"
        num_turns += 1
      end
    end

    num_turns
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      windex_1 = win_combination[0]
      windex_2 = win_combination[1]
      windex_3 = win_combination[2]

      if position_taken?(windex_1) && @board[windex_1] == @board[windex_2] && @board[windex_1] == @board[windex_3]
        return [windex_1, windex_2, windex_3]
      end
    end

    return false
  end

  def full?
    @board.all? {|value| value == "X" || value == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    display_board

    until over?
      turn
    end

    if won?
      return puts "Congratulations #{winner}!"
    end

    puts "Cat's Game!"
  end
end
