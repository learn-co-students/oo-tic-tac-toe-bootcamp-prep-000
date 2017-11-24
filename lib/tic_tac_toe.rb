class TicTacToe
  def initialize()
    @board = Array.new(9, " ")
  end

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play()
    while !(over?())
      turn()
    end

    if won?()
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end

  def turn()
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      return display_board
    else
      puts "Please try again (1-9): "
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        return display_board
      else
        return turn()
      end
    end
  end

  def input_to_index(input)
    index = input.to_i
    return index - 1
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end


  def move (index, player)
    index = index.to_i
    @board[index] = player
  end

  def current_player()
    if turn_count() == 0
      return "X"
    elsif turn_count() % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end


  def turn_count()
    counter = 0
    @board.each_index do |i|
      if (@board[i] == " ")
        counter == counter
      else
        counter += 1
      end
    end
    return counter
  end


def won?()
  WIN_COMBINATIONS.each do |i|
    first = i[0]
    second = i[1]
    third = i[2]
    if @board[first] == "X" && @board[second] == "X" && @board[third] == "X"
      winner = "X"
      return i
    elsif @board[first] == "O" && @board[second] == "O" && @board[third] == "O"
      winner = "O"
      return i
    end
  end
  return false
end

def full?()
  if @board.include?(" " || "")
    return false
  else
    return true
  end
end

def draw?()
  if full?() && won?() == false
    return true
  end
end

def over?()
  if full?() || won?() || draw?()
    return true
  else
    return false
  end
end

def winner()
  x_win = 0
  o_win = 0
  @board.each do |i|
    if i == "X"
      x_win += 1
    elsif i == "O"
      o_win += 1
    end
  end

  if x_win > o_win
    return "X"
  elsif o_win > x_win
    return "O"
  else
    return nil
  end
end

  WIN_COMBINATIONS = [
  [0,1,2], # Top Horizontal
  [3,4,5], # Middle Horizontal
  [6,7,8], # Bottom Horizontal
  [0,3,6], # Left Vertical
  [1,4,7], # Middle Vertical
  [2,5,8], # Right Vertical
  [0,4,8], # L to R Diag
  [2,4,6]  # R to L Diag
]


end
