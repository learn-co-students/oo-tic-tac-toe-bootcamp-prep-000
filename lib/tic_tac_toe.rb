class TicTacToe
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #Top row
    [3,4,5], #Middle row
    [6,7,8], #Bottom row
    [0,3,6], #Left column
    [1,4,7], #Middle column
    [2,5,8], #Right column
    [0,4,8], #Left start diagonal
    [2,4,6]  #Right start diagonal
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
   counter = 0
   @board.each do |turn|
    if (turn == "X") || (turn == "O")
      counter +=1
    end
   end
   return counter
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
  winner = []
  empty_board = @board.all? { |x| x == " "}
  WIN_COMBINATIONS.each do |sub_array|
      if empty_board
        return false
      elsif sub_array.all? { |value| @board[value] =="X" } || sub_array.all? { |value| @board[value] =="O" }
        winner = sub_array
      end
    end
    winner == [] ? false : winner
  end

  def full?
    !@board.any? { |x| x == " " }
  end

  def draw?
    !won? && full? ? true : false
  end

  def over?
    draw? || won? ? true : false
  end

  def winner
    winning_board = won?
    winning_board ? @board[winning_board[0]] : nil
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
