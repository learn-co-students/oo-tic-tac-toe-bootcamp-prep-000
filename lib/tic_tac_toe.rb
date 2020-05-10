class TicTacToe
  WIN_COMBINATIONS = [[0, 1, 2], # Top row
                      [3, 4, 5], # Bottom row
                      [6, 7, 8], # Last row
                      [0, 3, 6], # Left col
                      [1, 4, 7], # Middle col
                      [2, 5, 8], # Right
                      [0, 4, 8], # X1
                      [2, 4, 6]  # X2
                      ]
  def initialize
    @board = [" "] * 9
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(index)
    index.to_i - 1
  end
  
  def move(index, char)
    @board[index] = char
  end
  
  def position_taken?(index)
    !(@board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0, 8) and !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9"
    user_input = input_to_index(gets.strip)
    
    if valid_move?(user_input)
      move(user_input, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    9 - @board.count(" ")
  end
  
  def current_player
    (turn_count.even? ? "X" : "O")
  end
  
  def won?
    # Check empty board
    if !@board.any?{|c| c == "X" || c == "O"}
      return false
    end
  
    # Check for winners
    WIN_COMBINATIONS.select{|row| row.all?{|index| position_taken?(index)}}.each do |row|
      if row.all?{|index| @board[index] == 'X'} or row.all?{|index| @board[index] == 'O'}
        return row
      end
    end
    # No winners ? must be draw
    false
  end
  
  def full?
    !@board.any?(" ")
  end
  
  def draw?
    # Draw
    if won? or !full?
      return false
    elsif @board.count{|c| c == "O" or c == "X"} == 9
      return true
    end
  end
  
  def over?
    (draw? or won?)
  end
  
  def winner
    player = won?
    if player
      return @board[player[0]]
    end
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