class TicTacToe

  def initialize
    # puts "Welcome to Tic Tac Toe!"
    @board = Array.new(9, " ")
    # play(@board)
  end

  def board
    @board
  end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
 end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left Column
    [1,4,7],  # Middle Column
    [2,5,8],  # Right Column
    [0,4,8],  # Diagnoal L to R
    [2,4,6]  # Diagnoal R to L
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

  def move (position, player)
    @board[position] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move? (index)
    if index.between?(0, 8)
      if position_taken?(index) == false
        true
      end
    end
  end

  def turn
    puts "Please enter 1-9:"
    gets_index = gets.strip
    index = input_to_index(gets_index)
      if valid_move?(index)
        move(index, current_player)
      else
        turn
      end
    display_board
  end

  def won?
    WIN_COMBINATIONS.detect do |win|
      @board[win[0]] == @board[win[2]] && @board[win[1]] == @board[win[2]] && position_taken?(win[0])
    end
  end

  def full?
    unless @board.any? { |i| i == " " }
      true
    end
  end

  def draw?
    !won? && full?

  end

  def over?
    draw?  ||  full? || won?
  end

  def winner
    if winning_array = won?
      @board[winning_array[0]]
    end
  end

  def play
    9.times do
      if !over?
        turn
      elsif draw?
        puts "Cat's Game!"
        break
      elsif won?
        puts "Congratulations #{winner}!"
        break
      end
    end
  end

end

