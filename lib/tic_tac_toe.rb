class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
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

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    return !(@board[index] == " " || @board[index] == "")
  end

  def valid_move?(index)
    return index.between?(0, 8) && !position_taken?(index)
  end

  def turn_count
    count = 0
    @board.each do |input|
      if input == "X" || input == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    count = turn_count
    if count.even?
      return "X"
    else
      return "O"
    end
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
    WIN_COMBINATIONS.each do |combo|
      pos_1 = @board[combo[0]]
      pos_2 = @board[combo[1]]
      pos_3 = @board[combo[2]]

      if pos_1 == pos_2 && pos_1 == pos_3 && position_taken?(combo[0])
        return combo
      end
    end
    return false
  end

  def full?
    return !@board.any? {|pos| pos == " "}
  end

  def draw?
    return full? && !won?
  end

  def over?
    return full? || draw? || won?
  end

  def winner
    arr = won?
    if arr
      return @board[arr[0]]
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
