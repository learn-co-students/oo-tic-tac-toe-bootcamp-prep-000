class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

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

  def move(index, token)
    @board[index] = token
  end

  def valid_move?(index)
    index.between?(0, 8) && !(position_taken?(index))
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player

    if (valid_move?(index))
      move(index, token)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{|token| token =="X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8],
  ]

  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == @board[win_combination[1]] &&
      @board[win_combination[1]] == @board[win_combination[2]] &&
      position_taken?(win_combination[0])
    end
  end

  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if winning_combo = won?
      @board[winning_combo.first]
    end
  end

  def play
    until over?
      turn
    end

    winning_token = winner

    if winning_token != nil
      puts "Congratulations #{winning_token}!"
    else
      puts "Cat's Game!"
    end
  end
end
