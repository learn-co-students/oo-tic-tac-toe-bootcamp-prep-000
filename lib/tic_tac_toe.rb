class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " "," ", " ", " ", " "])
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(n)
    index = n.to_i - 1
  end

  def move(index, symbol)
    @board[index] = symbol
  end


  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0,8)
      if position_taken?(index) == false
        return true
      end
    end
    false
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    while valid_move?(index) == false
      return turn
    end
    move(index, current_player)
    display_board
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
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

  def won?
    WIN_COMBINATIONS.each do |comb|
      if (@board[comb[0]] == "X" && @board[comb[1]] == "X" && @board[comb[2]] == "X") ||
        (@board[comb[0]] == "O" && @board[comb[1]] == "O" && @board[comb[2]] == "O")
        return comb
      end
    end
        return false
  end

  def full?
    i = 0
    while i < 9
      if !position_taken?(i)
        return false
      end
      i += 1
    end
  return true
  end

  def draw?
     !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      nil
    end
  end

  def turn_count
    counter = 0
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
      if turn_count % 2 == 0 || turn_count == 0
      return "X"

  else return "O"
  end
end
end
