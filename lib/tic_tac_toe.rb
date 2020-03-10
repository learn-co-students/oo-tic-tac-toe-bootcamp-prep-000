class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row 
    [0,4,8], # Diagonal 0 
    [2,4,6], # Diagonal 2
    [0,3,6], # Left Column 
    [1,4,7], # Middle Column
    [2,5,8]  # Right Column
  ]
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  def board 
    @board 
  end 
  
  # Helper Methods
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
    count = 0
    @board.each { |cell|  count += 1 if cell == "X" || cell == "O"}
    return count
  end 
  def current_player
    current_player = "O"
    current_player = "X" if turn_count % 2 == 0 
    return current_player
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
     WIN_COMBINATIONS.detect { |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      }
  end
  def full?
   !@board.detect { |cell| cell.nil? || cell == " " || cell == ""}
  end
  def draw?
    if  won?
      return false
    else
      return full?
    end 
  end
  def over?
    won? || draw? || full?
  end 
  def winner
    won?? @board[won?[0]] : nil
  end
  def play
    until over? do 
      turn
    end
    if won? 
      puts "Congratulations #{winner}!"  
    elsif draw?
      puts "Cat's Game!" 
    end
  end 
end