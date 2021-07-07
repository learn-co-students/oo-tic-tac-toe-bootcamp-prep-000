require "pry"

class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

  def move(index,char)
    @board[index] = "#{char}"
  end

  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true
    end
    return false
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    end
    return false
  end

  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    #binding.pry
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.each do |array|
      if (@board[array[0]] == "X" && @board[array[1]] == "X" && @board[array[2]] == "X") || (@board[array[0]] == "O" && @board[array[1]] == "O" && @board[array[2]] == "O")
        return array
      end
    end
    return false
  end

  def full?
    return !@board.any?{|entry| entry == " " || entry == ""}
  end

  def draw?
    return (full? && !won?)
  end

  def over?
    return (won? || full? || draw?)
  end

  def winner
    if !won?
      return nil
    end
    return @board[won?[0]]
  end

  def play
    until over?
      turn
    end

    if won?
      person = winner
      puts "Congratulations #{person}!"
    end

    if draw?
      puts "Cat's Game!"
    end
  end
end
