class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Column 1
  [1,4,7], # Column 2
  [2,5,8], # Column 3
  [0,4,8], # Diagonal 1
  [6,4,2] # Diagonal 2
  ]
  
  def input_to_index(user_input)
    @index = user_input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
      index.between?(0,8) && !position_taken?(index)
  end
    
  def turn
    puts "Please choose a number 1-9:"
    user_input = gets.chomp
    index = input_to_index(user_input)
    current = current_player
    if valid_move?(index)
      move(index, current)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      end
    end
    return false
  end
  
  def full?
    @board.all? {|space| space != " "}
  end
  
  def draw?
    if full? && !won?
      return true
    end
  end
  
  def over?
    if won? || full? || draw?
      return true
    end
  end
  
  def winner
    if won?
      arr = won?
      index = arr[0]
      return @board[index]
    else
      return nil
    end
  end
  
  def play
    until over? == true
      turn
    end
  
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end