class TicTacToe

  def initialize(board = Array.new(9, " "))
    @board = board
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

    row_one = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    row_two = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    row_three = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    line_separate = "-----------"
    puts row_one
    puts line_separate
    puts row_two
    puts line_separate
    puts row_three
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, char = "X")
    @board[index] = char
  end

  def position_taken?(index)
    if @board[index] == "" || @board[index] == " " || @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(index)
    if index.between?(0, 8) && position_taken?(index) == false
      true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
   turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do|combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return combination
      elsif  position_1 == "O" && position_2 == "O" && position_3 == "O"
        return combination
      else
        false
      end
    end
    empty_board = @board.all? do|position|
      position == "X" || position == "O"
  end
  WIN_COMBINATIONS.include?(@board)
  end

  def full?

    full_board = @board.all? do|e|
      e == "X" || e == "O"
    end
  end

  def draw?

  full?
  if won?
    return false
  end
    @board.all? do|e|
      e == "X" || e == "O"
    end
  end

  def over?
    if won? || full? || draw?
      return true
    end
  end

  def winner
    WIN_COMBINATIONS.each do|combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return "X"
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
         return "O"
    end

    end
    return nil
  end

  def play
    counter = 0
    while !over?

      turn
      counter += 1
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end

end
