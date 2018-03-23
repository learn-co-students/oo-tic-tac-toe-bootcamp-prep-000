class TicTacToe
  
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  # Helper Method
  def input_to_index(user_input)
    return user_input.to_i - 1 
  end
  
  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(index)
   ( @board[index] == "X" || @board[index] == "O")
  end
  
  def valid_move?(index)
    return index.between?(0,8) && !position_taken?(index)
  end
  
   def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
  
    if(!valid_move?(index))
      turn
    else
      player = current_player
      move(index, player )
      display_board
    end
  end
  
  def turn_count
    count = 0 
    @board.each do |turn|
      turn == "X" || turn == "O" ? count+= 1 : 0
    end
    return count
  end
  
  def current_player
    return turn_count % 2 == 0 ? "X" : "O"
  end
  
  
  def won?
    marker = nil
    WIN_COMBINATIONS.select do|combo|
      if(position_taken?(combo[0]))
        marker = @board[combo[0]]
        combo.all? {|i|@board[i].include?(marker)}
      end
    end.pop
  end
  
  def full?
    @board.all? do|pos| 
      position_taken?( @board.index(pos))
    end
  end
  
  def draw?
    !won?&&full?
  end
  
  def over?
    won?||draw?
  end
  
  def winner
   won? ? @board[won?[0]]:nil
  end
  
  
  
  
  
  
  
  
  # code your input_to_index and move method here!
  
  
  
  
 
  
  def play
   
    counter = 1 
    
    until over? do
      turn
      counter += 1 
    end
    if(winner=="X")
      puts "Congratulations X!"
    elsif(winner=="O")
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
    
    
  end
end