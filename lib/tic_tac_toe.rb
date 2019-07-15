class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def display_board
    puts [" #{@board[0]} | #{@board[1]} | #{@board[2]} "]
    puts "-----------"
    puts [" #{@board[3]} | #{@board[4]} | #{@board[5]} "]
    puts "-----------"
    puts [" #{@board[6]} | #{@board[7]} | #{@board[8]} "]
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    if index < 0 || index > 9 || position_taken?(index)
      return false
    else
      return true
    end
  end

  def turn
    puts "Please select a position between 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Please select a position between 1-9"
      input = gets.strip
    end
  end

  def turn_count
    count = 0
    @board.each do |item|
      if item == "X" || item == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.any? do |item|
      if position_taken?(item[0]) && @board[item[0]] == @board[item[1]] && @board[item[1]] == @board[item[2]]
        return item
      end
    end
  end

  def full?
    @board.all? do |item|
      item == "X" || item == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end

end
