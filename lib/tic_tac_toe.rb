class TicTacToe

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #mid row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left col
    [1, 4, 7], #mid col
    [2, 5, 8], #right col
    [0, 4, 8], #\ diag
    [2, 4, 6] #/ diag
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, char = "X")
    @board[index] = char
  end

  def position_taken?(index)
    if @board[index] != " "
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts "Please input 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, char = current_player)
      display_board
    else
      turn
    end
  end 

  def turn_count
    counter = 0
    @board.each do |space|
      if space != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count % 2 == 0
      current = "X"
    else
      current = "O"
    end
    current
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      @board[combination[0]] == @board[combination[1]] &&
      @board[combination[1]] == @board[combination[2]] && 
      position_taken?(combination[0])
    end
  end

  def full?
    @board.all? do |space|
      space != " "
    end
  end

  def draw?
    !won? && full?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if winning_player = won?
      @board[winning_player[0]]
    end
  end

  def play
    puts "WELCOME TO TIC TAC TOE!"
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end
