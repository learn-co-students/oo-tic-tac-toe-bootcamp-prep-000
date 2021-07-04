class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # left column
  [1,4,7], # mid column
  [2,5,8], # right column
  [0,4,8], # diag start left
  [2,4,6] # diag start right
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
  
  def move(index, char = "X")
    @board[index] = char
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O" ? true : false
  end
  
  def valid_move?(index)
    if index.between?(0, 8) == false
      return false
    elsif index.between?(0, 8) == true && position_taken?(index) == false
      return true
    else
      return false
    end
  end  
  
  def turn
    puts "Pick input 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, char = current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |char|
      if char == "X" || char == "O"
        counter+=1
      end
    end
    return counter
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_one = win_combination[0]
      win_index_two = win_combination[1]
      win_index_three = win_combination[2]
      
      position_one = @board[win_index_one]
      position_two = @board[win_index_two]
      position_three = @board[win_index_three]
      
      if position_one == "X" && position_two == "X" && position_three == "X" || position_one == "O" && position_two == "O" && position_three == "O"
        return win_combination
      end
    end
  else
    return false
  end
  
  def full?
    @board.each do |index|
      if index == " "
        return false
      end
    end
  end
  
  def draw?
    if won? == false && full? != false
      return true
    end
  end
  
  def over?
    if won? != false || draw? == true
      return true
    end
  end
  
  def winner
    won = won?
    if won? == false
      return NIL
    else
     return @board[won[0]]
    end
  end
  
  def play
    until over?
      turn
    end
    
    if won? != false
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!" 
    end
  end
  
end