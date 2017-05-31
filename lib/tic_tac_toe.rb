class TicTacToe

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def initialize
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end

  def valid_move?(index)
    position_taken?(index) == false && index < 9 && index >= 0 ? true : false
  end

  def turn_count
    @board.count("X") + @board.count("O")
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    user_input = gets.strip
    x = input_to_index(user_input)
    y = current_player

    if valid_move?(x)
        move(x, y)
        display_board
    else
        turn
    end
  end

  def won?
    x_count = []
    o_count = []

    @board.each_with_index do |x,i|
        x_count << i if x == "X"
        o_count << i if x == "O"
    end

    WIN_COMBINATIONS.each do |combos|
      return combos if combos.all? {|x| x_count.include?(x)}
      return combos if combos.all? {|x| o_count.include?(x)}
    end

    return false if turn_count == 9
  end

  def full?
    turn_count == 9 ? true : false
  end

  def draw?
    if full? && won? == false
      return true
    else
      false
    end
  end

  def over?
    if draw? || won?
      true
    elsif full? == false
      false
    end
  end

  def winner
    return @board[won?[0]] if won?
    nil
  end

  def play
    until over?
      turn
    end

    puts "Cat's Game!" if draw?
    puts "Congratulations #{winner}!" if won?
  end

end
