class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
    WIN_COMBINATIONS = [
    [0, 1, 2], #row 1
    [3, 4, 5], #row 2
    [6, 7, 8], #row 3
    [0, 3, 6], #column 1
    [1, 4, 7], #column 2
    [2, 5, 8], #column 3
    [0, 4, 8], #diagonal top left to bottom right
    [2, 4, 6] #diagonal top right to bottom left
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    return (index >= 0 && index <= 8 && @board[index] != "X" && @board[index] != "O")
  end

  def turn
    puts "Please enter 1-9"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if !valid_move?(index)
      turn
    end
    move(index, token)
    display_board
  end

  def turn_count
    counter = 0
    @board.each do |index|
      if index != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    if !(@board.include?("X") || @board.include?("O"))
      return false
    end
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      if (position_taken?(win_index_1) && (@board[win_index_1] == @board[win_index_2]) && (@board[win_index_1] == @board[win_index_3]))
        # puts "#{@board[win_index_1]}, #{@board[win_index_2]}, #{@board[win_index_3]}"
        return win_combination
      end
    end
    false
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    return full? && !won?
  end

  def over?
    won? || full?
  end

  def winner
    return won? ? @board[won?[0]] : nil
  end

  def play
    while !over?
      turn
      draw? ? break : nil
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end

# tic = TicTacToe.new(["X", "X", "X", " ", " ", " ", " ", " ", " "])
# puts tic.won?
