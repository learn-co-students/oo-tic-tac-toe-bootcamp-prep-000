class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def display_board
    bar = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts bar
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts bar
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(number)
    index = number.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    @board[index] != " "
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    number = gets.strip
    index = input_to_index(number)
    if valid_move?(index)
      value = current_player
      move(index, value)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if "#{position}" == "X" || "#{position}" == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    turn = turn_count
    if turn % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |array|
      matchesX = []
      matchesO = []
      array.each do |position|
        matchesX << position if @board[position] == "X"
        matchesO << position if @board[position] == "O"
      end
      if matchesX.length == 3
        return matchesX
      elsif matchesO.length == 3
        return matchesO
      end
    end
    return false
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won? == false
      puts nil
    else
      win = won?[0]
      @board[win]
    end
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
