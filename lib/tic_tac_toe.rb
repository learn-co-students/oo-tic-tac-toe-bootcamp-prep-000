class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def move(location, token)
    @board[location.to_i-1] = token
  end

  def position(location)
    @board[location.to_i]
  end

  def position_taken?(location)
    !(position(location).nil? || position(location) == " ")
  end

  def valid_move?(input)
    input.to_i.between?(1,9) && !position_taken?(input.to_i-1)
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    if !valid_move?(input)
      turn
    end
    move(input, current_player)
  end

  def won?
    WIN_COMBINATIONS.detect do |combination|
      position(combination[0]) == position(combination[1]) &&
      position(combination[1]) == position(combination[2]) &&
      position_taken?(combination[0])
    end
  end

  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end

  def draw?
    !won? && @board.all?{|token| token == "X" || token == "O"}
  end

  def over?
    won? || draw?
  end

  def winner
    if win_combination = won?
      @winner = position(win_combination.first)
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

end
