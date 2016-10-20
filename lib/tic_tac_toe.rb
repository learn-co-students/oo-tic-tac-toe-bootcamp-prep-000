class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(p)
    pos = p.to_i - 1
  end

  def move(pos, xo="X")
    @board[pos] = xo
  end

  def position_taken?(position)
    if @board[position] == "X"
      true
    elsif @board[position] == "O"
      true
    elsif @board[position] == " " || @board[position] == ""
      false
    else @board[position] == nil
      false
    end
  end

  def valid_move?(move)
    move = move.to_i
    if position_taken?(move) == false && move.between?(0,8) == true
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    pos = gets.strip
    index = input_to_index(pos)
    xo = current_player
    if valid_move?(index) == true
      move(index, xo)
      display_board
    else
      turn
    end
  end

  def turn_count
    filled = @board.select do |space|
      space == "X" || space == "O"
    end
    filled.length
  end

  def current_player
    if (turn_count+1) % 2 == 0
      "O"
    else
      "X"
    end
  end

  $the_winner = ""

  def won?
    is_winner = false
    WIN_COMBINATIONS.each do |combo|
        if combo.all? do |pos|
          @board[pos] == "X"
        end
        is_winner = true
      elsif combo.all? do |pos|
          @board[pos] == "O"
        end
        is_winner = true
      else
        next
      end
    end
    if is_winner == true
      xwin = WIN_COMBINATIONS.select do |combo|
          combo.all? do |pos|
            @board[pos] == "X"
          end
        end
      owin = WIN_COMBINATIONS.select do |combo|
          combo.all? do |pos|
            @board[pos] == "O"
          end
        end
        if xwin == []
          $the_winner = "O"
          owin[0]
        else
          $the_winner = "X"
          xwin[0]
        end
    else
      false
    end
  end

  def full?
    @board.all? do |pos|
      pos == "X" || pos == "O"
    end
  end

  def draw?
    if full? && !won?
      true
    elsif !full? && !won?
      false
    elsif won?
      false
    else
      false
    end
  end

  def over?
    if won? != false || draw? == true
      true
    end
  end

  def winner
    if draw? || !over?
      nil
    else
      $the_winner
    end
  end

  def play
    while !over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cats Game!"
    end
  end
end
