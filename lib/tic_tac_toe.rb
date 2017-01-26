class TicTacToe
   def initialize(board = nil)
     @board = board || Array.new(9, " ")
   end

   WIN_COMBINATIONS =
    [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

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

  def move(position, char="X")
    @board[position] = char
  end

  def position_taken?(position)
    @board[position] != " "
  end

  def valid_move?(position)
    !position_taken?(position) && position.between?(0,8)
  end

  def turn_count
    @board.count {|i| i != " "}
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Choose a position between 1-9"
    position = input_to_index(gets)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      potential_win = [
        @board[win_combo[0]],
        @board[win_combo[1]],
        @board[win_combo[2]]
      ]

      if potential_win.all? { |el| el == "X" } || potential_win.all? { |el| el == "O" }
        return win_combo
      end
    end
    false
  end

  def full?
    @board.all? {|pos| pos != " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    !won? ?  nil : @board[won?[0]]
  end

  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
