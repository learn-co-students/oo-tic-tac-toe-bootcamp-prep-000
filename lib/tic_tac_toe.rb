class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    # Horizontal Rows
    [0,1,2],
    [3,4,5],
    [6,7,8],

    # Vertical Rows
    [0,3,6],
    [1,4,7],
    [2,5,8],

    # Diagonal Rows
    [0,4,8],
    [2,4,6]
  ]

  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move (index, token = "X")
    @board[index] = token
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index) ? true : false
  end

  def turn
    puts "Please pick an open space (1 - 9)"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Sorry that space is not available"
      turn
    end
  end

  def turn_count
    9 - @board.count(" ")
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      holder = []
      combination.each do |space|
        holder << @board[space]
      end
      if holder[0] == holder[1] && holder[0] == holder[2] && holder[0] != " "
        return combination
      end
    end
    FALSE
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    if full?
      won? ? false : true
    end
  end

  def over?
    draw? || won?
  end

  def winner
    won?.is_a?(Array) ? @board[won?[0]] : nil
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
