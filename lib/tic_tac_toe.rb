class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end

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

  def move(index, char = "X")
    @board[index] = char
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index].nil?)
  end

  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end

  def turn_count
    9 - @board.count(" ")
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    puts "Where would you like to go? 1-9:"
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
    WIN_COMBINATIONS.each do |combo|
      temp = [@board[combo[0]], @board[combo[1]], @board[combo[2]]]
      return combo if temp.uniq.length == 1 && temp[0] != " "
    end
    false
  end

  def full?
    !@board.include?(" ")
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board[won?.first] : nil
  end

  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
       puts "Cat's Game!"
    end
  end

end
