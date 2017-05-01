class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # left columns
    [1,4,7], # middle columns
    [2,5,8], # right column
    [0,4,8], # diag top left to right
    [6,4,2] #diag top right to left
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    return user_input.to_i - 1
  end

  def move(position, char)
    @board[position] = char
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " " || @board[index] == "")
  end

  def valid_move?(index)
    if position_taken?(index) || index > @board.length || index < 0
      return false
    else
      return true
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index)
      play_char = current_player
      move(index, play_char)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] # load the value of the board at win_index_1
      position_2 = @board[win_index_2] # load the value of the board at win_index_2
      position_3 = @board[win_index_3] # load the value of the board at win_index_3

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def full?
    @board.all? do |position|
      (position == "X" || position == "O")
    end
  end

  def draw?
    return !won? && full?
  end

  def over?
    return draw? || won?
  end

  def winner
    win_combo = won?
    if win_combo == false
      return nil
    else
      winning_position1 = win_combo[0]
      return @board[winning_position1]
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
