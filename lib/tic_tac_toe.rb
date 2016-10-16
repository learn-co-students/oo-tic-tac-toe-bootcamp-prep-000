class TicTacToe

  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left column
    [1, 4, 7], #middle column
    [2, 5, 8], #right column
    [0, 4, 8], #top left to bottom right diagonal
    [6, 4, 2] #bottom left to top right diagonal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(position, current_player = "X")
    index = position.to_i - 1
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(position)
    index = position.to_i - 1
    index.between?(0,8) && !position_taken?(index)
  end

  def turn
    player = current_player
    puts "Please enter 1-9:"
    input = gets.strip
    if valid_move?(input)
      move(input, player)
      display_board
    else
      turn
    end
  end

  def turn_count
    occupied_cells = @board.select {|cell| cell == "X" || cell == "O"}
    occupied_cells.length
  end

  def current_player
    turn_count.even? ? current_player = "X" : current_player = "O"
  end

  def won?
    if WIN_COMBINATIONS.any? do |win_combination|
        win_combination.all? {|index| @board[index] == "X"} ||
        win_combination.all? {|index| @board[index] =="O"}
      end
      WIN_COMBINATIONS.each do |win_combination|
        if win_combination.all? {|index| @board[index] == "X"} ||
          win_combination.all? {|index| @board[index] =="O"}
          return win_combination
        end
      end
    else false
    end
  end

  def full?
    @board.all? {|i| i == "X" || i == "O" }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      winner = won?.first
      @board[winner]
    end
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

end
