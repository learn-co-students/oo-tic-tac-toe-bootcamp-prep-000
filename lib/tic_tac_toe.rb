class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts "-----------"
  end
  
  def input_to_index(input)
    index = input.to_i - 1
  end
  
  def move(index, value = "X")
    @board[index] = value
  end
  
  def position_taken?(index)
    if @board[index] != " "
      true 
    else
      false 
    end
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
  end
  
  def turn
    puts "Select a number 1-9"
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?(index)
      move(index, value = current_player)
    else
      turn
    end
    display_board
  end
  
  def turn_count
    @board.count{|value| value == "X" || value == "O"}
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
    
  def won?
    WIN_COMBINATIONS.each do |win_combo| 
      if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X")
        return win_combo
      elsif (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O")
        return win_combo
      end
    end
    return false
  end
  
  def full?
    !@board.any? " "
  end
  
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  def over?
    if full? || won? || draw?
      true
    else
      false
    end
  end
  
  def winner
    win_combo = won?
    if won? && @board[win_combo[0]] == "X"
      "X"
    elsif won? && @board[win_combo[0]] == "O"
      "O"
    else
      nil
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