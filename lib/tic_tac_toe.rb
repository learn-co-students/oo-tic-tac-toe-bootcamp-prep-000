class TicTacToe

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def move(input, char = "X")
    @board[input.to_i - 1] = char
  end

  def position_taken?(position)
    @board[position] == "X" || @board[position] == "O" ? true : false
  end

  def valid_move?(input)
    !position_taken?(input.to_i - 1) && input.to_i.between?(1, 9)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      turn
    end
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [2, 4, 6],
    [0, 4, 8]
  ]

  def won?
    WIN_COMBINATIONS.detect do |win_combination|

        @board[win_combination[0]] == @board[win_combination[1]] &&
        @board[win_combination[1]] == @board[win_combination[2]] &&
        position_taken?(win_combination[0])

   end
  end

  def turn_count
    @board.count { |i| i == "X" || i == "O" }
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def full?
    !@board.detect { |i| i == " " || i == "" }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      winningIndex = won?[0]
      @board[winningIndex]
    end
  end

end
