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
    [2,4,6],
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

  def move(position, current_player)
      @board[position] = current_player
  end

  def position_taken?(position)
    @board[position] != " " ? true : false
  end

  def valid_move?(position)
    (position >= 0 && position <= 8) && @board[position] == " " ? true : false
  end

  def turn_count
      count = 0
      @board.each { |index| count += 1 if index == "X" || index == "O" }
      return count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Enter position 1-9:"
    input = gets.strip
    index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
  end

  def won?
      WIN_COMBINATIONS.each do |win_comb|
        position_1 = @board[win_comb[0]]
        position_2 = @board[win_comb[1]]
        position_3 = @board[win_comb[2]]
        return win_comb if (position_1 != " ") && ((position_1 == position_2) && (position_1 == position_3))
      end
    return false
  end

  def full?
    @board.all? { |index| index != " " }
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
      WIN_COMBINATIONS.each do |win_comb|
        position_1 = @board[win_comb[0]]
        position_2 = @board[win_comb[1]]
        position_3 = @board[win_comb[2]]
        return position_1 if (position_1 != " ") && ((position_1 == position_2) && (position_1 == position_3))
      end
    return nil
  end

  def play
    turn until over?
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end


end
