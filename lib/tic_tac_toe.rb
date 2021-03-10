class TicTacToe
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

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def move(index, character = "X")
    @board[index] = character
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O" ? true : false
  end

  def valid_move?(position)
    !position_taken?(position) && position.between?(0, 9) ? true : false
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
    occupied_positions = 0
    @board.each do |index|
      if index == "X" || index == "O"
        occupied_positions += 1
      end
    end
    occupied_positions
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |winning_array|
      win_index_1 = winning_array[0]
      win_index_2 = winning_array[1]
      win_index_3 = winning_array[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return winning_array
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return winning_array
      end
    end
    return false
  end

  def full?
    @board.all?{|i| i == "X" || i == "O"}
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    won? || full? || draw? ? true : false
  end

  def winner
    if won?
      winning_character = won?[0]
      @board[winning_character]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
