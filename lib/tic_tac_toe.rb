  
  def input_to_index(input)
    input.to_i - 1 
  end 

class TicTacToe
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row 
    [3, 4, 5], # Middle row
    [6, 7, 8], # Bottom row
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    [0, 4, 8], # Left diagonal
    [2, 4, 6]  # Right diagonal 
  ]
  
  def initialize(board = Array.new(9, " "))
    @board = board
  end
  
  def display_board
    puts <<-BOARD
 #{@board[0]} | #{@board[1]} | #{@board[2]} 
-----------
 #{@board[3]} | #{@board[4]} | #{@board[5]} 
-----------
 #{@board[6]} | #{@board[7]} | #{@board[8]} 
BOARD
  end

  
  def move(i, player = "X")
    @board[i] = player
    @board 
  end
  
  def blank?(something)
    something.nil? || something.strip.empty?
  end
  
  def position_taken?(index)
    !blank?(@board[index])
  end
  
  def valid_move?(index)
    index.to_i.between?(0, 8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    player = current_player 
    i = input_to_index(input)
    if valid_move?(i)
      move(i, player)
      display_board
    else
      puts "Please enter another input"
      turn
    end
  end
  
  def turn_count
    @board.count { |cell| !blank? cell }
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.detect do |i, j, k|
      positions = [i, j, k].map { |p| @board[p] }
      position_taken?(i) && positions.all? { |p| p == positions[0] }
    end
  end
  
  def full?
    @board.all? { |position| !blank?(position) }
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
    win = won?
    @board[win[0]] if win
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