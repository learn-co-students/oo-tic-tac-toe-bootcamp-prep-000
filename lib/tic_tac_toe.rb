
class TicTacToe

  def initialize
    @board = [" "]*9
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

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def valid_move?(index)
    if index.between?(0,9) && !position_taken?(index)
      return true
    else
      return false
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def move(pos, char)
    return @board[pos] = char
  end

  def input_to_index(input)
    return input.to_i - 1
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

  def turn_count
    turn_num = 0
    @board.each do |space|
      if space != " " && space != ""
        turn_num += 1
      end
    end
    return turn_num
  end

  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end

  WIN_COMBINATIONS = [
    # Row
    [0,1,2],
    [3,4,5],
    [6,7,8],
    # Col
    [0,3,6],
    [1,4,7],
    [2,5,8],
    # Diagonal
    [0,4,8],
    [2,6,4]
  ]

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_x = win_combination.all? do |win_index|
        (@board[win_index] == "X")
      end
      win_o = win_combination.all? do |win_index|
        (@board[win_index] == "O")
      end
      if win_x || win_o
        return win_combination
      end
    end
    return false # should not be reached unless all win combinations not present
  end

  def full?
    [0,1,2,3,4,5,6,7,8].all? do |place|
      position_taken?(place)
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
    won? || draw? ||  full? ? true : false
  end

  def winner
    win_indexes = won?
    if win_indexes == false
      return nil
    else
      return @board[win_indexes[0]]
    end
  end

end



# Helper methods



# Helper Method

# Define your WIN_COMBINATIONS constant
