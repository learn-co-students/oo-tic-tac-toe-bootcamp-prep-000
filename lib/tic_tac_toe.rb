class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

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

  def move(index, player)
    @board[index] = player
  end

  def position_taken?(index)
    @board[index] == " " ? false : true
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8) ? true : false
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      puts "That doesn't work, try again"
      turn
    end
    display_board
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      pos1 = @board[combo[0]]
      pos2 = @board[combo[1]]
      pos3 = @board[combo[2]]
      return combo if pos1 == pos2 && pos2 == pos3 && pos1 != " "
    end
    false
  end

  def full?
    !@board.any?{|spots| spots == " "}
  end

  def draw?
    full? && !won? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    won? ? @board[won?[0]] : nil
  end

  def play
    display_board
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
