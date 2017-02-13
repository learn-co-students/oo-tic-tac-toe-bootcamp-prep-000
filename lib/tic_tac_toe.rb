class TicTacToe

  attr_accessor :board

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

  def initialize
    @board = Array.new(9, " ")
    #@board = [" "," "," "," "," "," "," "," "," "]
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

 def input_to_index(input)
   input = input.to_i - 1
 end

  def move(location, token)
    @board[location] = token
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(location)
    location.between?(0,8) && !position_taken?(location)
  end

  def turn
    #current_player // "X" "O"
    puts "Please enter 1-9:"
    input = gets.strip
    location = input_to_index(input)
    if valid_move?(location)
      move(location, current_player)
      display_board
    else
      puts "Input Error!"
      turn
    end
  end

  def turn_count
    @board.count do |i|
      i == "X" || i == "O"
    end
  end


  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?

    WIN_COMBINATIONS.find do |win_combination|

      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
  end

  def full?
    if @board.find {|i| i == "" || i == " " || i == nil}
       return false
   else
       return true
    end
  end

  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end

  def over?
      won? || draw? || full?
  end

  def winner
    if won?
     return @board[won?[0]]
   end
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

end
