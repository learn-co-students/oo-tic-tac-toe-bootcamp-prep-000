require 'pry'
class TicTacToe
  def initialize(board = nil)
    @board = board || [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  
  def display_board
    row1 = " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    row2 = " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    row3 = " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    line = "-----------"
    board = [row1, line, row2, line, row3]

    puts board
  end


  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, value = "X")
    @board[index] = value
    @board
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      false
    else
      true
    end
  end

  def on_board?(index)
    if index.between?(0, 8)
      true
    else
      false
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && on_board?(index)
      true
    else
      false
    end
  end

  def turn_count
    counter = 0
    @board.each do |square|
      if square != " "
        counter += 1
      end
    end
    counter
  end

  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "That move was not vaild please try again"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? { |index|  @board[index] == "X"} 
        return combo
      elsif combo.all? { |index| @board[index] == "O"}
        return combo
      end
    end
    return false
  end

  def full?
    @board.all? { |square| square != " " } 
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    winstring = nil
    if won?
      # binding.pry
      if @board[won?[0]] == "X"
        winstring = "X"
      elsif @board[won?[0]] == "O"
        winstring = "O"
      end
    end
    winstring
  end

  def play

    until over? 
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end 
end #END TICTACTOE