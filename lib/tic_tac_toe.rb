class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    puts "Please enter a number:"
     user_input.to_i - 1
  end

  def move(position, char="X")
    @board[position] = char
  end

  def position_taken?(index)
    if((@board[index] == "X") || (@board[index] == "O"))
      true
    else
      false
    end
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if (position == "X" || position == "O")
        counter += 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 || turn_count == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    input.to_i
    new_input = input_to_index(input)
    if(valid_move?(new_input))
      move(new_input, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[2]] == @board[combo[1]]
    end
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

  def draw?
    if full? && !won?
      return true
    else
      false
    end
  end

  def over?
    if draw? || won?
      return true
    else
      false
    end
  end

  def winner
    winning_char = won?
    if !won?
      return nil
    elsif @board[winning_char[0]] == "X"
      return "X"
    elsif @board[winning_char[0]] == "O"
      return "O"
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
