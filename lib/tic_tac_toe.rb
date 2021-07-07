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
    [2,4,6]
  ]

  def display_board
    def dashed_line
      11.times {print "-"}
      puts ""
    end
    puts " #{@board[0]} " + "|" + " #{@board[1]} " + "|" + " #{@board[2]} "
    dashed_line
    puts " #{@board[3]} " + "|" + " #{@board[4]} " + "|" + " #{@board[5]} "
    dashed_line
    puts " #{@board[6]} " + "|" + " #{@board[7]} " + "|" + " #{@board[8]} "
  end

  def input_to_index(pos)
    board_pos = pos.to_i - 1
  end

  def move(index, x_or_o)
    @board[index] = x_or_o
  end

  def position_taken?(index)
     !((@board[index] == " ") || (@board[index] == "") || (@board[index] == nil))

  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)

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

    occupied = 0

    @board.each do |pos|
      if pos != '' && pos != ' ' && pos != nil
          occupied += 1
      end
    end

    occupied

  end


  def current_player
    player = turn_count.even? ? 'X' : 'O'
  end

  def won?

    WIN_COMBINATIONS.each do |win_combination|

      positions_to_check  = [@board[win_combination[0]],
                            @board[win_combination[1]],
                            @board[win_combination[2]]]

      if positions_to_check.all?{|position| position == "X"} ||
          positions_to_check.all?{|position| position == "O"}
        return win_combination
      end
    end
    false # no winning combinations were found, return false
  end

  def full?

    @board.each_with_index do |val, index|
      if !position_taken?(index)
        return false
      end
    end
    true # all the positions must have been taken
  end

  def draw?

    !won? && full?

  end

  def over?

    won? || draw?

  end

  def winner
    winning_positions = won?
    if winning_positions
      return @board[winning_positions[0]]
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
