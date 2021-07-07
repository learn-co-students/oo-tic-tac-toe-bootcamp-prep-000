class TicTacToe
  def initialize(board=Array.new(9, " "))
    @board = board
  end
  
  WIN_COMBINATIONS = [ 
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
 
  def input_to_index(user_input)
    user_index = user_input.to_i 
    user_index - 1 
  end
 
  def move(index, player_token)
    @board[index] = player_token
  end
 
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if !(position_taken?(index)) && (index.between?(0, 8))
      TRUE
    else
      FALSE
    end
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def turn 
    puts "Please enter 1-9:"
  
    input = gets
    index = input_to_index(input)
  
    if valid_move?(index)
      move(index, current_player)
      display_board

    else turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
    
    @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]] && position_taken?(win_combination[0])
    end
  end
  
  def full?
    @board.none? {|i| i.nil? || i == " "}
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if win_combo = won?
      return @board[win_combo.first]
    end
  end
  
  def play
    while(!over?)
      turn
    end
  
    if won?
      puts "Congratulations #{winner}!"
    
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end