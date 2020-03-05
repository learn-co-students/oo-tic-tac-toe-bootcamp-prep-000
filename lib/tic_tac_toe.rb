class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],

    [0, 4, 8],
    [2, 4, 6],

    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board()
    puts(" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts("-----------")
    puts(" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts("-----------")
    puts(" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def position_taken?(index)
    if !(@board[index] == " ")
      return true
    end
    return false
  end

  def valid_move?(index)
    if !(position_taken?(index))
      # separated the two if's for code clarity
      if (!((@board[index] == "X") || (@board[index] == "O")) && (index >= 0 && index <= 8))
        return true
      end
    end
    return false
  end

  def move(index, char)
    if (valid_move?(index))
      @board[index] = char
    end
  end

  def turn()
    puts "Please enter 1-9: "
    index = input_to_index(gets.strip.to_i)
    if !(index >= 0 && index <= 8)
      turn()
    else
      move(index, current_player())
      display_board
    end
  end

  def turn_count()
    turn = 0
    @board.each do |space|
      if space != " "
        turn += 1
      end
    end

    return turn
  end

  def current_player()
    if (turn_count() % 2 == 0)
      return "X"
    end

    return "O"
  end

  def won?()
    '''
    for each win_combination in WIN_COMBINATIONS
      # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
      # grab each index from the win_combination that composes a win.
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
      else
        false
      end
    end
    '''

    WIN_COMBINATIONS.each do |win_combination|
      # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
      # grab each index from the win_combination that composes a win.
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      # checking for x
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination # return the win_combination indexes that won.
      end

      # checking for o
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination # return the win_combination indexes that won.
      end
    end

    return false
  end

  def full?()
    @board.each do |space|
      if space == " "
        return false
      end
    end

    return true
  end

  def draw?()
    if full?() && !(won?())
      return true
    end

    return false
  end

  def over?()
    if won?() || full?() || draw?()
      return true
    end

    return false
  end

  def winner()
    winning_combo = won?()
    if winning_combo == false
      return nil
    end
    return @board[winning_combo[0]]
  end

  def play()
    '''
    until the game is over
      take turns
    end

    if the game was won
      congratulate the winner
    else if the game was a draw
      tell the players it has been a draw
    end
    '''

    while !(over?()) do
      turn()
      display_board()
    end

    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end
end
