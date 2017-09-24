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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input_integer = input.to_i
    index = input_integer - 1
  end

  def move(index, char)
    @board[index] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ") # NilClass public instance method, nil? -> true
  end

  def valid_move?(index)
    if !position_taken?(index)
      if index.between?(0,8)
        true
      else
        false
      end
    else
      false
    end
  end

  def turn_count
    turns = 0
    @board.each do |token|
      if token != "" && token != " " && token != nil
        turns += 1
      end
    end
    turns
  end

  def current_player
    turns = turn_count
    turns % 2 == 0 ? player = "X" : player = "O"
    player
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    char = current_player
    if valid_move?(index)
      move(index, char)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      position_1 = win_combo[0]
      position_2 = win_combo[1]
      position_3 = win_combo[2]
      if position_taken?(position_1) && position_taken?(position_2) && position_taken?(position_3)
        if @board[position_1] == @board[position_2] && @board[position_2] == @board[position_3]
          return win_combo
        end
      end
    end
    false
  end

  def full?
    @board.each_index do |i|
      return false if !position_taken?(i)
    end
    true
  end

  def draw?
    if full? && !won?
      true
    else
      false
    end
  end

  def over?
    if draw?
      true
    elsif won?
      true
    else
      false
    end
  end

  def winner
    win_combo = won?
    win_combo ? @board[win_combo[0]] : nil
  end

  def play
    until over?
      turn
    end
    if !!won?
      char = winner
      puts "Congratulations #{char}!"
    else
      puts "Cat's Game!"
    end
  end

end
