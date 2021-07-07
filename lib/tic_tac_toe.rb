class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left collumn
    [1, 4, 7], # Middle collumn
    [2, 5, 8], # Right collumn
    [0, 4, 8], # Backward diagonal
    [2, 4, 6], # Forward diagonal
  ]
  
  LINE = "-----------"
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts LINE
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts LINE
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
  end
  
  def move(index, tic_or_tac = "X")
    @board[index] = tic_or_tac
  end
  
  def position_taken?(index)
    @board[index] != " "
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between?(0,8)
  end
  
  def turn_count
    @board.count { |tic_or_tac| tic_or_tac == "X" || tic_or_tac == "O" }
  end
  
  def current_player
    turn_count() % 2 == 0 ? "X" : "O"
  end
  
  def turn
    #player_1_or_2 = current_player() == "X" ? "1" : "2"
    #puts "It is player #{player_1_or_2}'s turn."
    puts "Which position do you want to go?"
    position = gets.strip
    index = input_to_index(position)
    if valid_move?(index)
      tic_or_tac = current_player()
      move(index, tic_or_tac)
      display_board()
    else 
      puts "That is an invalid position, please try again."
      turn()
    end
  end
  
  def won?
  	WIN_COMBINATIONS.each do |combination_position|
  		combination_tic_or_tac = []
  		combination_position.each do |position|
  			combination_tic_or_tac << @board[position]
  		end
  		if combination_tic_or_tac == ["X", "X", "X"] || combination_tic_or_tac == ["O", "O", "O"]
  			return combination_position
  		end
  	end
  	return false
  end
  
  def full?
    @board.all? { |tic_or_tac| tic_or_tac == "X" || tic_or_tac == "O" }
  end
  
  def draw?
    !won?() && full?()
  end
  
  def over? 
    draw?() || won?() != false
  end
  
  def winner
    won?() ? @board[won?()[0]] : nil
  end
  
  def play
    until over?() == true
      turn()
    end
    
    if won?() 
      puts "Congratulations #{winner()}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
      
      
      
      
    
    
    
    
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  