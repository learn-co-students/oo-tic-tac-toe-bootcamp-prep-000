class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Right Diagonal
    [2,4,6]  # Left Diagonal
  ]

  def initialize
    @board = Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "")
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    count = @board.select do |index|
      !(index == " " || index == "")
    end
    count.length
  end

  def current_player
    turn_count.odd? ? "O" : "X"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if valid_move?(index)
      move(index, token)
      display_board
    else
      turn
    end
  end

  def won?
    i = 0
    x_moves = []
    o_moves = []
    @board.each do |token|
      if token == "X"
        x_moves << i
      elsif token == "O"
        o_moves << i
      end
      i += 1
    end

    winners = false
    WIN_COMBINATIONS.each do |combos|
      if combos.all? {|combo| x_moves.include?(combo)}
        winners = combos
        # winners << combos[0]
        # winners << combos[1]
        # winners << combos[2]
      elsif combos.all? {|combo| o_moves.include?(combo)}
        winners = combos
      end
    end
      return winners
  end

  def full?
    !(@board.include?("") || @board.include?(" "))
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw? || full?
  end

  def winner
    index = won?
    if index
      @board[index[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
