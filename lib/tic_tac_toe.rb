require 'pry'

class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
    puts '-----------'
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts '-----------'
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(i, token = "X")
    @board[i] = token
  end

  def position_taken?(i)
    @board[i] != " "
  end

  def valid_move?(i)
    !position_taken?(i) && i.between?(0, 8)
  end

  def turn_count
    @board.count { |token| token != " " }
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    player = current_player

    puts "Please enter 1-9"
    input = gets.strip
    index = input_to_index(input)


    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end

  def won?
    x_indices = []
    o_indices = []
    win_status = false

    @board.each_index do |i|
      x_indices << i if @board[i] == "X"
      o_indices << i if @board[i] == "O"
    end


   WIN_COMBINATIONS.each do |combination|
      if x_indices & combination == combination || o_indices & combination == combination
        win_status = combination
      end
    end
    win_status
  end

  def full?
    @board.none?{|space| space === " "}
  end

  def draw?
    full?  && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    winning_indices = won?
    winner = won? ? @board[winning_indices[0]] : nil
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
