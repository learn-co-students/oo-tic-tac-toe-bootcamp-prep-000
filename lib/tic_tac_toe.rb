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
    puts "  #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts "  #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts "  #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
  user_input.to_i - 1
  end
  
  def move(index, mark="X") 
    if !position_taken?(index)
      @board[index] = mark
    end
    @board
  end
  
  def position_taken?(pos_idx)
    if @board[pos_idx] == " " || @board[pos_idx] == "" || @board[pos_idx] == nil
      return false
    elsif @board[pos_idx] == "X" || @board[pos_idx] == "O" 
      return true
    end
  end 
  
  def valid_move?(index)
    if position_taken?(index) || !index.between?(0, 8)
      return false
    else 
      return true
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
    mark = current_player
    if valid_move?(index)
      move(index, mark)
    else
      turn
    end
    display_board
  end
  
  def turn_count
    counter = 0 
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1 
      end
    end
    counter
  end  
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
        return win_combo
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
        return win_combo
      end
    end
    return false
  end
  
  def full?
    @board.all? do |spot|
      (spot.include?("X") || spot.include?("O")) && @board.count == 9
    end
  end
  
  def draw?
    if won?
      return false 
    end
    WIN_COMBINATIONS.each do |win_combo|
      if (@board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X") || !full?
        return false
      elsif (@board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O") || !full?
        return false
      end
    end
    return true
  end
  
  def over?
    draw? || won?
  end

  def winner
    WIN_COMBINATIONS.each do |win_combo|
      if @board[win_combo[0]] == "X" && @board[win_combo[1]] == "X" && @board[win_combo[2]] == "X"
        return "X"
      elsif @board[win_combo[0]] == "O" && @board[win_combo[1]] == "O" && @board[win_combo[2]] == "O"
        return "O"
      end
    end
    return nil
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