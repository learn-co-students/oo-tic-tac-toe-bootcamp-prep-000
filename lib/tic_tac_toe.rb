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

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(input, current_player = "X")
    @board[input_to_index(input)] = current_player
    puts input_to_index(input)
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    return @board.count("X") + @board.count("O")
  end

  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |c|
      if c.all? { |value| @board[value] == "X" } ||
        c.all? { |value| @board[value] == "O" }
        return c
      end
    end
    return false
  end

  def full?
    return @board.none? { |cell| cell == " "}
  end

  def draw?
    return !won? && full?
  end

  def over?
    return won? || draw? || full?
  end

  def winner
    winner = won? and return @board[winner[0]]
    return nil
  end

  def play
    until over?
      turn
    end

    puts won? ? "Congratulations #{winner}!" : "Cats Game!"
  end
end
