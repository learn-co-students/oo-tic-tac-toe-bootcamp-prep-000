class TicTacToe
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

  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0, 8) && (position_taken?(index) == false)
  end

  def turn
    puts "Please enter a number between 1-9:"
    input = gets.strip
    input = input_to_index(input)
    if (valid_move?(input))
      move(input, current_player)
      display_board
    else
      puts "Invalid input!"
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |space|
      if space != " "
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      index1 = combination[0]
      index2 = combination[1]
      index3 = combination[2]
      if position_taken?(index1) && position_taken?(index2) && position_taken?(index3)
        if (@board[index1] == @board[index2]) && (@board[index2] == @board[index3])
          return combination
        end
      end
    end
    return false
  end

  def full?
     @board.all? do |position|
      position == "O" || position == "X"
    end
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if won? || draw? || full?
      true
    else
      false
    end
  end

  def winner
    if draw? || !over?
      return nil
    else
      return @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
