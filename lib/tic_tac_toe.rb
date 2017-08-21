class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

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

  def won?
    winning = WIN_COMBINATIONS.any? do |win|
      (@board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X") || (@board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O")
    end
    if winning == true
      winboard = WIN_COMBINATIONS.select do |win|
        (@board[win[0]] == "X" && @board[win[1]] == "X" && @board[win[2]] == "X") || (@board[win[0]] == "O" && @board[win[1]] == "O" && @board[win[2]] == "O")
      end
      winboard[0]
    end
  end

  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw?
  end

  def winner
    winningboard = won?
    if winningboard != nil
      winner = @board[winningboard[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if won? != nil
      puts "Congratulations #{winner}!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end

end
