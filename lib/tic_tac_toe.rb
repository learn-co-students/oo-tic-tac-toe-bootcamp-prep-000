class TicTacToe
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], # top row
    [3, 4, 5], # middle row
    [6, 7, 8], # bottom row
    [0, 3, 6], # left column
    [1, 4, 7], # middle column
    [2, 5, 8], # right column
    [0, 4, 8], # diagonal 1
    [2, 4, 6]  # diagonal 2
  ]

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(position, player)
    @board[position] = player
  end

  def position_taken?(position)
    if (@board[position] == "X" || @board[position] == "O")
      return true
    end
    return false
  end

  def valid_move?(position)
    if ( position.between?(0, 8) && !position_taken?(position) )
      return true
    end
    return false
  end

  def turn_count()
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player()
    if turn_count() % 2 == 0
      return "X"
    else return "O"
    end
  end

  def turn()
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if !valid_move?(index)
      turn()
    else
      move(index, current_player())
      display_board()
    end
  end

  def won?()
      WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def full?()
    @board.all? { |e| (e == "X" || e == "O") }
  end

  def draw?()
    if !won?() && full?()
      return true
    else return false
    end
  end

  def over?()
    if won?() || full?() || draw?()
      return true
    end
  end

  def winner()
    win_combination = won?()
    if won?() == false
      return nil
    else
      if @board[win_combination[0]] == "X"
        return "X"
      elsif @board[win_combination[0]] == "O"
        return "O"
      end
    end
  end

  def play()
    while !over?()
      turn()
    end

    if won?()
      puts "Congratulations #{winner()}!"
    end

    if draw?()
      puts "Cat's Game!"
    end
  end

end
