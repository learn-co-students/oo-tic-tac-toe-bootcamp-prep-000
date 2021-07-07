class TicTacToe

  def initialize(board=[" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

    WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #left to right diagonal
    [2, 4, 6] #right to left diagonal
  ]

  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end

  def move(position, char="X")
    @board[position] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index) || !(index.between?(0, 8))
      return false
    end

    true
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if space != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    if (turn_count % 2) != 0
      "O"
    else
      "X"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_taken?(win_index_1) && (position_1 == position_2 && position_2 == position_3)
        return win_combination
      end
    end
    false
  end

  def full?
    @board.all? do |position|
      position != " "
    end
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if draw? || won?
      true
    else
      false
    end
  end

  def winner
    if over?
      win_index = won?[0]
      @board[win_index]
    end
  end

  def play

    until over?
    turn
    end

    if won?
      champion = winner
      puts "Congratulations #{champion}!"
    elsif draw?
      puts "Cat's Game!"
    end

  end

end
