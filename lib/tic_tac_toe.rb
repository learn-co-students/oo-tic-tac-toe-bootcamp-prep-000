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
    [2,4,6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    (input.to_i) - 1
  end

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index <= 8 && index != -1 && @board[index] == " "
      true
    else
      false
    end
  end

  def turn_count
    turns = 0
    @board.each do |entry|
      if entry == "X" || entry == "O"
        turns += 1
      end
    end
    turns
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end

  def turn
    index = input_to_index(gets.to_i)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      pos_1 = @board[win_combo[0]]
      pos_2 = @board[win_combo[1]]
      pos_3 = @board[win_combo[2]]

      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") ||
        (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
        return win_combo
      end
    end
    false
  end

  def full?
    @board.all? do |entry|
      entry == "X" || entry == "O"
    end
  end

  def draw?
    if won? == false && full? == true
      true
    else
      false
    end
  end

  def over?
    if won? != false || draw? == true
      true
    else
      false
    end
  end

  def winner
    if won? != false
      win_combo = won?
      if @board[win_combo[0]] == "X"
        "X"
      elsif @board[win_combo[0]] == "O"
        "O"
      end
    end
  end

  def play
    until over? == true
      turn
    end

    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    elsif draw? == true
      puts "Cat's Game!"
    end
  end
end
