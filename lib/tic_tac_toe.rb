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
    input.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    elsif @board[index] == ""
      false
    elsif @board[index] == nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(index)
    if @board[index] == " " && index.between?(0,8)
      return true
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X"
        counter += 1
      elsif turn == "O"
        counter += 1
      end
    end
  return counter
  end

  def current_player
    count = turn_count()
      if count % 2 == 0
        return "X"
      else
        return "O"
      end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    value = current_player
    if valid_move?(index)
      move(index, value)
    else
      puts "Try again please"
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      end
      if position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return nil
  end

  def full?
    index = 0
    items_in_board = @board.size
    while index < items_in_board
      if @board[index] == "" || @board[index] == " "
        return false
      end
      index += 1
    end
    return true
  end

  def draw?
    if !won? && !full?
      return false
    end
    if !won? && full?
      return true
    end
    if !won?
      return false
    end
  end

  def over?
    if full? || draw? || won?
      return true
    else
      return false
    end
  end

  def winner
    if won? == nil
      return nil
    end
    win_combo = won? #get winning array
    index = win_combo[0]
    if @board[index] == "X"
      return "X"
    elsif @board[index] == "O"
      return "O"
    end
  end

  def play
    while over? != true do
      turn()
    end
    if won?
      winner = winner()
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end
