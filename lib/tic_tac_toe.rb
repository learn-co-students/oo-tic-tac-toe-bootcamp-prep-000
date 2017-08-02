class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

  end
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [0, 4, 8],
    [2, 4, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    integer = input.to_i
    @index = integer - 1
  end

  def move(move_index, char)
    @board[move_index] = char
    return @board
  end

  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "" || @board[index] ==nil)
      false
    else
      true
    end
  end

  def valid_move?(index)
    if (index.between?(0,8) && (!position_taken?(index)))
      true
    else
      false
    end
  end

  def turn_count
    @count = 0
    @board.each do |space|
      if (space == "X" || space == "O")
        @count += 1
      end
    end
    return @count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
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
    WIN_COMBINATIONS.each do |win_combo|
      if ((win_combo.all? {|pos| @board[pos] == "X"}) ||
        (win_combo.all? {|pos| @board[pos] == "O"}))
        return win_combo
      end
    end
    nil
  end

  def full?
    @board.all? { |pos| pos == "X" || pos == "O" }
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end


  def winner
    if over?
      if won?.all?{|pos| @board[pos] =="X"}
        return "X"
      elsif won?.all?{|pos| @board[pos] == "O"}
        return "O"
      else
        return nil
      end
    end
  end

  def play
    #move_count = 0
    until over?
      #if !over?(board)
      turn
      #end
      #move_count += 1
    end
    if won?
      the_winner = winner
      puts "Congratulations #{the_winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
