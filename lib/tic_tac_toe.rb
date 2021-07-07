class TicTacToe

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4 ,6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, value="X")
    @board[index] = value
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0, 8)
      if !(position_taken?(index))
        return true
      end
    end
    return false
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
    count = 0
    @board.each do |val|
      if !(val == " " || val == "")
        count += 1
      end
    end
      return count
  end

  def current_player
    if turn_count.even?
      return "X"
    end
    return "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |combination|
      pos_0 = combination[0]
      pos_1 = combination[1]
      pos_2 = combination[2]
      val = @board[pos_0]

      if val != " " && val != "" && @board[pos_1] == val && @board[pos_2] == val
        return combination
      end
    end
    return false
  end

  def full?
    @board.each do |val|
      if val == " " || val == ""
        return false
      end
    end
    return true
  end

  def draw?
    if !won? && full?
      return true
    end
    return false
  end

  def over?
    if won? || draw? || full?
      return true
    end
    return false
  end

  def winner
    combination = won?  # Win combination or false.
    if combination
      return @board[combination[0]]  # combination[0] would be a board position
                                     # where winner had made a move.
    end
  end

  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
