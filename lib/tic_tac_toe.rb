class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # TOP ROW
    [3,4,5], # MIDDLE ROW
    [6,7,8], # BOTTOM ROW
    [0,3,6], # FIRST COLUMN
    [1,4,7], # MIDDLE COLUMN
    [2,5,8], # LAST COLUMN
    [0,4,8], # DIAGONAL TOP LEFT, BOTTOM RIGHT
    [2,4,6]  # DIAGONAL TOP RIGHT, BOTTOM LEFT
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

  def move(index, value)
    @board[index] = value
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn_count
    @board.count{|x| x == "X" || x == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def moveRequest
    puts "Please enter 1-9 for your move:"
    index = input_to_index(gets.strip)
  end

  def turn
    index = moveRequest
    value = current_player
    if valid_move?(index)
      move(index, value)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect { |combo|
        if position_taken?(combo[0])
          @board[combo[0]] == "X" &&
          @board[combo[1]] == "X" &&
          @board[combo[2]] == "X" ||
          @board[combo[0]] == "O" &&
          @board[combo[1]] == "O" &&
          @board[combo[2]] == "O"
        end
      }
  end

  def full?
    @board.all?{ |move| move != " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      winning_combo = won?
      if @board[winning_combo[0]] == "X"
        "X"
      else
        "O"
      end
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
