class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

  def board
    @board
  end



  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end


  def move
    board[index] = current_player
    display_board
  end

  def valid_move?(index)
  index.between?(0,8) && !position_taken?
  end

  def position_taken?(index)
    board[index] != " "
  end

  def turn(index)
    puts 'Please enter 1-9:'
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?
      move
    else
      turn
    end
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def turn_count
    filled = board.select{|token| token == "X" || token == "O"}
    filled.length
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]] == board[combo[1]] &&
      board[combo[1]] == board[combo[2]] &&
      position_taken?
    end
  end

  def full?
    board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || full?
  end

  def winner
    if winning_combo = won?
      board[winning_combo.first]
    end
  end

  def current_player
    current = nil
    if turn_count.odd?
      current = "O"
    elsif turn_count.even?
      current = "X"
    end
    return current
  end

  def play
    until over? || draw?
      turn
    end
      if draw?
        puts "Cat's Game!"
      elsif won? && winner == "X"
        puts "Congratulations X!"
      elsif won? && winner == "O"
        puts "Congratulations O!"
    end
  end


end
