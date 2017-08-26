class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], [3,4,5], [6,7,8],
    [0,3,6], [1,4,7], [2,5,8],
    [0,4,8], [2,4,6]
  ]

  def initialize(board = nil)
    @board = Array.new(9, " ")
  end

  def display_board
    puts " #{@board[0] } | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3] } | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6] } | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, character)
    @board[index] = character
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    !position_taken?(index) && (index >= 0 && index <= 8)
  end

  def turn_count
    count = 0
    @board.each do |item|
      if item == "X" || item == "O"
        count+=1
      end
    end
    count
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
    else turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] &&
      @board[win_combination[1]] == @board[win_combination[2]] &&
      position_taken?(win_combination[0])
    end
  end

  def full?
    @board.all? do |item|
      item == "X" || item == "O"
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || draw? || won?
  end

  def winner
    if win = won?
      @board[win[0]]
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
