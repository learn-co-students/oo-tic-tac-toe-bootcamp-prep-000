
class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #mid row
    [6,7,8], #bot row
    [0,3,6], #left col
    [1,4,7], #mid col
    [2,5,8], #bot col
    [0,4,8], #top left to bot right
    [2,4,6]  #top right to bot left
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input = input.to_i
    input.between?(1,9) ? input - 1 : -1
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "" || @board[index].nil?)
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    used_squares = @board.reject do |position|
      position == "" || position == " " || position.nil?
    end
    used_squares.size
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
      good_move = false

      until good_move
      puts "Choose a move by entering 1-9"
      input = gets.strip
      index = input_to_index(input)
      good_move = valid_move?(index)
    end
      move(index, current_player)
      display_board
  end

  def move(index, element)
    @board[index] = element
  end

  def won?
    WIN_COMBINATIONS.detect do |win_con|
      @board[win_con[0]] == @board[win_con[1]] && @board[win_con[1]] == @board[win_con[2]] && position_taken?(win_con[0])
    end
  end

  def full?
    @board.none? do |pos|
      pos == "" || pos == " " || pos.nil?
    end
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    winner = won?
    winner ? @board[winner[0]] : winner
  end

  def play

    while !over?
      turn
    end

    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"



  end

end
