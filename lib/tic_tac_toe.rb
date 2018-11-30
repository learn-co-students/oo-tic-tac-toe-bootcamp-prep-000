class TicTacToe
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
      [0, 1, 2], #top row
      [3, 4, 5], #middle row
      [6, 7, 8], #bottom row
      [0, 3, 6], #left column
      [1, 4, 7], #middle column
      [2, 5, 8], #right column
      [0, 4, 8], #slash
      [2, 4, 6] #backslash
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

  def move(index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |space|
      if (space == "X" || space == "O")
        counter+=1
      end
    end
    return counter
  end

  def current_player
    turns = turn_count
    if turns.even?
      return "X"
    else
      return "O"
    end
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

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0] #first position in winning combo
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1] #what's in that position on board?
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
  end

  def full?
    @board.all? do |space|
      (space == "X" || space == "O")
    end
  end

  def draw?
    if won?
      return false
    elsif !full?
      return false
    else
      return true
    end
  end

  def over?
    if (draw? || won?)
      return true
    else
      return false
    end
  end

  def winner
    check_board = won?
    if check_board.class == Array
      return @board[check_board[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end
