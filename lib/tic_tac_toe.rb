class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
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
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(input)
    @index = input.to_i - 1
  end
  def move(index, character = "X")
    @board[index] = character
  end 
  def position_taken?(index)
    @board[index] != " " && 
    @board[index] != "" && 
    @board[index] != nil
  end 
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, character = current_player)
    else 
      turn
    end
    display_board
  end
  def turn_count
    counter = 0
    @board.each do |moves|
      if moves == "X" || moves == "O"
        counter += 1
      end
    end
    return counter
  end 
  def current_player
    if turn_count % 2 == 0
      "X"
    else 
      "O"
    end
  end
  def won?
    WIN_COMBINATIONS.detect do |win_combo| 
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    @board[win_index_1] == @board[win_index_2] && @board[win_index_2] == @board[win_index_3] &&
    @board[win_index_1] != " " 
    end
  end
  def full?
   @board.each do |check|
     if check == " "
      return false
     end
    end 
    return true
  end 
  def draw?
    if !won? && full?
      return true
    elsif won?
      return false
    end
  end
  def over?
    won? || draw? || full?
  end
  def winner
    winning_combo = won?
    if winning_combo != nil
      @board[winning_combo[0]]
    else 
      winning_combo
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
