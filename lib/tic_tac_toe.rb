class TicTacToe
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Lower row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # top-left to bottom-right diagonal
  [2,4,6]  # top-right to bottom-left diagonal
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    converted_input = user_input.to_i - 1
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end

  def position_taken?(index_number)
    if @board[index_number] == " " || @board[index_number] == "" || @board[index_number] == nil
      false
    else
      true
    end
  end
  
  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8)
      true
    else
      false
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
      turn
    end
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination| 
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X" || @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
      return win_combination # return winning combo.
      end 
    end 
    return false # return false if there is no win combo present in board.
  end

  def full?
    @board.all? { |element| element != " " }
  end

  def draw?
    if full? && !won?
      return true 
    else
      return false 
    end
  end

  def over?
    if won? || draw? || full?
      return true 
    end
  end

  def winner
    if won?
      return @board[won?[0]] # return first element of winning trio.
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
