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
  [6,4,2],
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    count = 0
    @board.each do |x|
      if x === "O" || x === "X"
        count += 1
      end
    end
    count
  end

  def current_player
    if turn_count % 2 === 0
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    b = input_to_index(input)
    if valid_move?(b)
      move(b, current_player)
      display_board
    else
      turn
    end
  end

  def won?
  WIN_COMBINATIONS.each do |x|
    p1 = @board[x[0]]
    p2 = @board[x[1]]
    p3 = @board[x[2]]
    if p1 == "X" && p2 == "X" && p3 == "X"
      return [x[0], x[1], x[2]]
    elsif p1 == "O" && p2 == "O" && p3 == "O"
      return [x[0], x[1], x[2]]
    end
  end
  return false
end

  def full?
    @board.each do |x|
    if x == " "
      return false
    end
  end
    true
  end

  def draw?
    full? && !won?
  end

  def over?
    if full? || draw? || won?
      return true
    end
  end

  def winner
  count_x = 0
  count_o = 0
  @board.each do |x|
    if x == "X"
      count_x +=1
    elsif x == "O"
      count_o +=1
    end
  end

  if won? && count_x > count_o
    "X"
  elsif won? && count_x < count_o
    "O"
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
