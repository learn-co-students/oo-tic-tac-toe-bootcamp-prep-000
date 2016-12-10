class TicTacToe
  def initialize(board = [" "," "," "," "," "," "," "," "," ",])
    @board = board
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, char)
      index = position - 1 #index starts at 0.
      @board[index] = char
  end

  def position_taken?(position)
    if @board[position] == " " || @board[position] == "" || @board[position] == nil
      false
    elsif @board[position] == "X" || @board[position] == "O"
      true
    end
  end

  def valid_move?(position)
    @position_fixnum = position
    turn_string_to_valid_index #Given position is a String. I have to convert it to String.
    if !position_taken?(@position_fixnum) && @position_fixnum.between?(0,8)
      true
    end
  end

  def turn_string_to_valid_index
    @position_fixnum = (@position_fixnum.to_i) - 1
  end

  def turn
    puts "Please enter 1-9:"
    turn_input = gets.strip.to_i
    if !turn_input.between?(1,9)
      turn
    end

    if valid_move?(turn_input)
      move(turn_input, current_player)
      display_board
    end
  end

  def turn_count
    (@board.select { |move| move == "X" || move == "O"}).length
  end

  def current_player

    if turn_count % 2 == 0
      "X"
    else
      "O"
    end

  end

  def won?

    WIN_COMBINATIONS.each do |win_index|
      win_position_1 = win_index[0]
      win_position_2 = win_index[1]
      win_position_3 = win_index[2]

      if (@board[win_position_1] == "X" && @board[win_position_2] == "X" && @board[win_position_3] == "X") || (@board[win_position_1] == "O" && @board[win_position_2] == "O" && @board[win_position_3] == "O")
        return win_index
      else
        false
      end

    end

    false
  end

  def full?
    @board.all? { |move| move == "X" || move == "O"}
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end

  end

  def over?
    if won? || full? || draw?
      true
    else
      false
    end


  end

  def winner
    if won?
      position_1 = won?[0]
      @board[position_1]
    else
      nil
    end

  end

  def play



      until over?
        turn


      end


    if winner == "X"

      puts "Congratulations X!"
    else
      puts "Congratulations O!"
    end

    if draw?
      puts "Cats Game!"
    end

  end

end
