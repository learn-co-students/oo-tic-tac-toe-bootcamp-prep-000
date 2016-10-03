class TicTacToe

  def initialize
    @board = Array.new [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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

  def move (input, char = "X")
    index = input.to_i - 1
    @board[index] = char
  end

  def position_taken?(index)
    if @board[index] == " "
      false
    elsif @board[index] == ""
      false
    elsif @board[index] == nil
      false
    else @board[index] == "X" || @board[index] == "O"
      true
    end
  end

  def valid_move?(input)
    index = input.to_i - 1
    if position_taken?(index) == false && index.between?(0, 8)
      true
    else
      false
    end
  end

  def turn
    char = current_player
    puts "Please enter 1-9:"
    input = gets.strip
    index = input.to_i - 1
    if valid_move?(input)
      move(input, char)
      display_board
    else
      turn
    end
  end

  def turn_count
    counter = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
     turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? { |index| @board[index] == "X"} || combo.all? { |index| @board[index] == "O"}
        return combo
      end
    end
    return nil
  end

  def full?
    @board.all? { |index| index == "X" || index == "O"  }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
     return @board[won?[0]]
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
   elsif winner == "O"
     puts "Congratulations O!"
   else
     puts "Cats Game!"
   end
  end

end
