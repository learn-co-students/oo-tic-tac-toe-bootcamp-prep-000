class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left columns
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #diagonal 1
    [6,4,2], #diagonal 2
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

  def move(position, token)
    @board[position] = token
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    else
      true
    end
  end

  def valid_move?(position)
    if position_taken?(position) == false && position.between?(0, 8)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    position = input_to_index(user_input)
    token = current_player
    if valid_move?(position) == true
      move(position, token)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count do |x|
      x == "X" || x == "O"
    end
  end

  def current_player
    if turn_count % 2 == 0
      token = "X"
    else
      token = "O"
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
  end

  def full?
    @board.all? do |position|
      if position == "X" || position == "O"
        true
      else
        false
      end
    end
  end

  def draw?
    if won? == false && full? == true
      true
    else
      false
    end
  end

  def over?
    if won? != false || draw? == true
      true
    else
      false
    end
  end

  def winner
    if winning_combination = won?
      return @board[winning_combination[0]]
    end
  end

  def play
    while over? == false
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
