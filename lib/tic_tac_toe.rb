class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],  # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left Column
    [1,4,7],  # Middle Column
    [2,5,8],  # Right Column
    [0,4,8],  # Left to right
    [2,4,6]   # Right to left
  ]
  
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

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
    counter = 0
    
    @board.each { |player| counter += 1 if player == "X" || player == "O" }
    
    return counter
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.detect{|win_combination| @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?( win_combination[0] )}
  end

  def full?
    @board.all?{|element| element == "X" || element == "O"}
  end
  
  def draw?
    full? && !won?
  end

  def over?
    won?|| draw? || full?
  end

  def winner
    if win_combination = won?
      @board[win_combination[0]]
    end
  end
  
  def play
    counter = 0
    
    while counter < 9
      break if over?
      turn
      counter += 1
    end
    
    puts "Congratulations #{winner}!" if won?
    puts "Cat's Game!" if draw?
  end
end