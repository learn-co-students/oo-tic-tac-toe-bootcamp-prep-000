class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    row_1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    row_2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    row_3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    div = "-----------"
    puts row_1
    puts div
    puts row_2
    puts div
    puts row_3
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move? (index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == ""
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0, 8) == true
      true
    else
      false
    end
  end

  def turn_count
    @counter = 0
      @board.each do |token|
        if token != " "
          @counter += 1
        end
      end
    return @counter
  end

  def current_player
    turn_count
    if @counter % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X")  || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.none?{|occ| occ == " " || occ == nil}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end
end
