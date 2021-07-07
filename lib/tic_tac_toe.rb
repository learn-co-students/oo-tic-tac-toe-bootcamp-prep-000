class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  WIN_COMBINATIONS = [
  [0,1,2], #top row win
  [3,4,5], #middle row win
  [6,7,8], #bottom row win
  [0,3,6], #leftmost win
  [1,4,7], #middle win
  [2,5,8], #rightmost win
  [0,4,8], #left-to-right win
  [2,4,6]  #right-to-left win
  ]

  def input_to_index(input)
    input.to_i - 1
  end

  def move(position,char = "X")
    @board[position] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |place|
      if place != " "
        counter += 1
      end
    end
    return counter
  end

  def current_player
    current_turn = turn_count.to_i
    if current_turn %2 == 0
      return "X"
    elsif current_turn %2 != 0
      return "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
        turn
    end
  end

  def won?
    if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "] || @board == nil
      return false
    end

    WIN_COMBINATIONS.detect do |i|
      index_1 = i[0]
      index_2 = i[1]
      index_3 = i[2]
      if @board[index_1] == "X" && @board[index_2] == "X" && @board[index_3] == "X" ||
         @board[index_1] == "O" && @board[index_2] == "O" && @board[index_3] == "O"
            true
      else
            false
          end
      end
  end

  def full?
    @board.none? do |index|
      index == " "
    end
  end

  def draw?
    if won? == nil && full? == true
      true
    else
      false
    end
  end

  def over?
    if draw? || won? || full?
        true
    else
        false
    end
  end

  def winner
    if won? == nil
      return nil
    end
    index_check = won?[0]
    board_check = @board[index_check]
    if board_check == "X"
      return "X"
    elsif board_check == "O"
      return "O"
    end
  end

  def play
    while !over?
      turn
    end
        if draw?
          puts "Cat's Game!"
            end
        if winner == "X"
          puts "Congratulations X!"
        elsif winner == "O"
          puts "Congratulations O!"
        end
      end

end
