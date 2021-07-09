class TicTacToe

  WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # top-left to bottom-right diagonal
  [2, 4, 6] # top-right to bottom-left diagonal
]

  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1  # convert string to integer, subtract 1 for index
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
      player = current_player
      move(index, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |pos|
      if pos == "X" || pos == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0 # if even
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |outer_pos| # First true, returns. Otherwise, nil
      win = false
      if position_taken?(outer_pos[0]) # If the first pos has X or O
        first_char = @board[outer_pos[0]]     # Save the first char
        win = outer_pos.all? do |inner_pos|  # Make sure rest of row has same char
          @board[inner_pos] == first_char
        end
      end
      win #returns true or false to the WIN_COMBINATIONS.detect
    end
  end

  def full?
    @board.all? do |pos|
      pos == "X" || pos == "O"
    end
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
    if won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if !won?
      return nil
    else
      @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
