class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [0,3,6],
    [0,4,8],
    [1,4,7],
    [2,4,6],
    [2,5,8],
    [3,4,5],
    [6,7,8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-------------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-------------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(position)
    !position_taken?(position) && position.between?(0,8)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)

    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each { |position| counter += 1 if position != " " }
    counter
  end

  def current_player
    turn_count.odd? ? "O" : "X"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      if position_taken?(win_combination[0]) && position_1 == position_2 && position_1 == position_3
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.none? { |position| position == ' ' }
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    puts "Welcome to TicTacToe!"

    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
