class TicTacToe
  def initialize(board=Array.new(9, " "))
    @board = board
  end

  def turn_count
    counter = 0
    @board.each do |el|
      if el == "X"
        counter += 1
      elsif el == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else return "O"
    end
  end

  def full?
    !@board.any? { |x| x == " " }
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won?
      return true
    elsif draw?
      return true
    elsif !full? && !won?
      return false
    end
  end

  def winner
      return nil if !won?
      arr = won?
      x = arr[0].to_i
      if @board[x] == "X"
        return "X"
      elsif @board[x] == "O"
        return "O"
      else return nil
      end
  end

  def won?
    killer = []
    WIN_COMBINATIONS.each do |set|
      if @board.count{|n| n == "X"} < 3 && @board.count{|n| n == "O"} < 3
        return false
      elsif (@board[set[0]] == "X" && @board[set[1]] == "X" && @board[set[2]] == "X")
        return set
      elsif (@board[set[0]] == "O" && @board[set[1]] == "O" && @board[set[2]] == "O")
        return set
      else killer << set
      end
    end
    return false if killer == WIN_COMBINATIONS
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

  # Helper Methods
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
