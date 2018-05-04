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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    turns = 0
    @board.each do |board_slot|
      if board_slot == "O" || board_slot == "X"
        turns += 1
      end
    end
    return turns
  end

  def current_player
    count = turn_count
    if count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    character = current_player
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, character)
      display_board
    else
      turn
    end
  end

  def winning_combos
    WIN_COMBINATIONS.select do |winning_combo|
      (@board[winning_combo[0]] == "X" && @board[winning_combo[1]] == "X" && @board[winning_combo[2]] == "X") || (@board[winning_combo[0]] == "O" && @board[winning_combo[1]] == "O" && @board[winning_combo[2]] == "O")
    end
  end

  def won?
    winning_combos.first
  end

  def full?
    !@board.any? do |board_position|
     board_position == " "
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || full? || draw?
  end

  def winner
    winning_combination = won?
    if winning_combination == nil
      return nil
    elsif @board[winning_combination[0]] == "X"
      return "X"
    else
      "O"
    end
  end

  def play
    until over?
      turn
    end #until loop
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end #if
  end#play
end#class
