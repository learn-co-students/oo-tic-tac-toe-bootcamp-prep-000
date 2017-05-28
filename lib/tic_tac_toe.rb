class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [6, 4, 2],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]

  def display_board
    row_seperator = "-----------"
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts row_seperator
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts row_seperator
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, character = "X")
    @board[position.to_i - 1] = character
  end

  def position_taken?(position)
    !(@board[position] == nil || @board[position] == " ")
  end

  def valid_move?(position)
    position.to_i.between?(1, 9) && position_taken?(position.to_i - 1) == false
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      puts "You entered an invalid move."
      turn
    end
  end

  def turn_count
    count = 0
    @board.each do |character|
      if character == "X" || character == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") ||
        (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
    end
  end

  def full?
    @board.all?{|character| character == "X" || character == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    if over? == false
      winner = nil
    elsif won?.all?{|index| @board[index] == "X"}
      winner = "X"
    elsif won?.all?{|index| @board[index] == "O"}
      winner = "O"
    end
  end
  
  def play
    turn while over? == false

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end