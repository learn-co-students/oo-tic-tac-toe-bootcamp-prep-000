
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # First diagonal
  [2,4,6]  # Second diagonal
]


class TicTacToe

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    3.times do |i|
      j = i * 3
      puts " #{@board[j]} | #{@board[j+1]} | #{@board[j+2]} "
      if i < 2
        puts "-----------"
      end
    end
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    cell = @board[index]
    cell != " " && cell != "" && cell != nil
  end

  def valid_move?(index)
    if not index.between?(0, @board.length-1)
      return false
    end
    not position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |item|
      counter += (" " == item) ? 0 : 1
    end
    counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
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
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[0]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end
  end

  def full?
    @board.all? { |e| e == "X" || e == "O" }
  end

  def draw?
    !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
    (win_combo = won?) ? @board[win_combo[0]] : nil
  end

  def play
    while !over?
      turn
    end

    if gamer = winner
      puts "Congratulations #{gamer}!"
    else
      puts "Cat's Game!"
    end
  end

end
