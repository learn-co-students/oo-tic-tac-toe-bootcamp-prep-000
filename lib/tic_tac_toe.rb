class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  def initialize(board = Array.new(9, " "))
    @board = board
  end
  def input_to_index(user_input)
    input_to_integer = Integer(user_input) rescue nil
    (!input_to_integer) ? (-1) : (input_to_integer - 1)
  end
  def position_taken?(position)
    (@board[position] != " ") && (@board[position] != "") && (@board[position] != nil)
  end
  def valid_move?(position)
    position.between?(0,8) && !position_taken?(position)
  end
  def move(position, player_token = "X")
    @board[position] = player_token
  end
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def turn
    puts "Please enter 1-9:"
    position = input_to_index(gets.strip)
    if valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end
  def turn_count
    @board.count { |item| (item == "X" || item == "O") }
  end
  def current_player
    turn_count.even? ? "X" : "O"
  end
  def empty?
    @board.all? {|e| e==nil || e==" " || e==""}
  end
  def won?
    if empty?
      false
    else
      WIN_COMBINATIONS.detect do |indexes|
        indexes.all? { |e| @board[e]=="X" } ||
        indexes.all? { |e| @board[e]=="O" }
      end
    end
  end
  def full?
    @board.all? {|e| e=="X" || e=="O"}
  end
  def draw?
    full? && !won?
  end
  def over?
    won? || draw?
  end
  def winner
    won? ? (@board[won?[0]]) : nil
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
