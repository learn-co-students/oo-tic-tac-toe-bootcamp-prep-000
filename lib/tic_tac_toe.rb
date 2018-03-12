class TicTacToe
  def initialize(board = nil)
   @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS =
  [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
[6,4,2]
   #[2,4,6]
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

def move (location, current_player = "X")
 @board[location.to_i] = current_player
 # turn_count
 # display_board
  end

  def position_taken?(location)
   @board[location] != " " && @board[location] != ""
  end

  def valid_move?(position)
  position.to_i.between?(0,8) && !position_taken?(position.to_i)
  #position.between?(0,8) && !position_taken?(position)
  #  display_board
  end

  # def turn
  #   puts "Please enter 1-9:"
  #   input = gets.strip
  #   index =  input_to_index(input)
  #        if valid_move?(index) ==true
  #          move(index, current_player)
  #       else
  #        until valid_move?(index) == true
  #          puts "invalid move"
  #    display_board #(@board)
  #    move(index, current_player)
  #     end
  # end
  # end
  def turn
    display_board
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else
      turn
    end
  end


  # def turn
  #   puts "Please enter 1-9:"
  #   i = gets.strip
  #   index = input_to_index(i)
  #   m = valid_move?(index)
  #   if m
  #     move(index, current_player)
  #   else m
  #     until m
  #       puts "Invalid. Please enter 1-9:"
  #       display_board
  #       i = gets.strip
  #       index = input_to_index(i)
  #       m = valid_move?(index)
  #       move(index, current_player)
  #     end
  #   end
  # end


    def turn_count
    count = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
      count += 1
      end
    end
    count
  end


  def current_player
  turn_count % 2 == 0 ? "X" : "O"
  # **(@board)
  end

    def won?
    WIN_COMBINATIONS.detect do |win_combination|
      @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" || @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
    end
  end


  #  WIN_COMBINATIONS.detect do |win_combination|
   #
  #    @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" or @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
  #  end
  #  win_index_1 = win_combination[0]
  #  win_index_2 = win_combination[1]
  #  win_index_3 = win_combination[2]
   #
  #  position_1 = @board[win_index_1]
  #  position_2 = @board[win_index_2]
  #  position_3 = @board[win_index_3]
   #
  #  if position_1 == "X" && position_2 == "X" && position_3 == "X"
  #     return win_combination
  #    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  #       return win_combination
  #        else
  #           false
  #  end
  #  end

  def full?
   if @board.detect {|i| i == " " || i == nil}
  return false
   else
  return true
   end
  end

  def draw?
    won? == nil && full?
  end


  def over?
    won? || full? || draw?
  end


  def winner
  if won?
     @board[won?[0]]
  end
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
