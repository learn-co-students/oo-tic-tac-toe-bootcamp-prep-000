
WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [2, 5, 8],
  [1, 4, 7],
  [0, 3, 6],
  [0, 4, 8],
  [2, 4, 6]
]


class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(input)
    index = input.to_i - 1
    index
  end
  def move(index, current_player = "X")
    @board[index] = current_player()
  end
  def position_taken?(index)
    if ((@board[index] == "X") || (@board[index] == "O"))
      return true
    else
      return false
    end
  end
  def valid_move?(pos)
    if pos.between?(0, 8)
      if !position_taken?(pos)
        return true
      end
    end
  end
  def turn_count
    empty_count = 0
    @board.select do |pos|
      if pos == " "
        empty_count += 1
      end
    end
    turn_count = 9 - empty_count
  end
  def current_player
    turn_count()
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end
  def turn
    puts "please chose a number 1 - 9:"
    input = gets.strip
    index = input_to_index(input)
    current_player()
    if valid_move?(index)
      move(index)
    else
      turn
    end
    display_board
  end
  def full?
    counter = 0
    while counter == 0
      @board.each do |pos|
        if pos == " "
          return false
        end
      end
    return true
    end
  end
  def won?
    w_combo = WIN_COMBINATIONS.select do |pos|
        ((@board[pos[0]] == @board[pos[1]]) &&
        (@board[pos[1]] == @board[pos[2]]) &&
        (position_taken?(pos[0])))
      end
    if w_combo == []
      return false
    else
      return w_combo[0]
    end
  end
  def draw?
    if ((full?) && (!won?))
      return true
    else
      return false
    end
  end
  def over?
    if full? || won?
      return true
    else
      return false
    end
  end
  def winner
      if draw?
        return nil
      elsif won?
        windex = won?[0]
        return @board[windex]
    end
  end
  def play
    until over? || draw?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
