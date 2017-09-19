class TicTacToe
  WIN_COMBINATIONS =
  [
    [0,1,2],[3,4,5],[6,7,8], # win by horizontal row
    [0,3,6],[1,4,7],[2,5,8], # win by vertical column
    [0,4,8],[2,4,6]          # win by diagonal
  ]

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def play
    current_turn = 1
    while current_turn <= 9
      if over?; break; end;
      turn
      current_turn += 1
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      all_x = combo.all? do |index|
        @board[index] == "X"
      end
      all_o = combo.all? do |index|
        @board[index] == "O"
      end
      if all_x || all_o
        return combo
      end
    end
    false
  end

  def full?
    result = @board.all? do |position|
      position == "X" || position == "O"
    end
    result
  end

  def draw?
    if full? && !won?
      return true
    end
    false
  end

  def over?
    if draw? || won?
      return true
    end
    false
  end

  def winner
    win = won?
    if win
      return @board[win[0]]
    end
    nil
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
end
