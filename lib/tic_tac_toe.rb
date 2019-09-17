class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], # top row
    [3,4,5], # middle row
    [6,7,8], # bottom row
    [0,3,6], # 1st col
    [1,4,7], # 2nd col
    [2,5,8], # 3rd col
    [0,4,8], # accross 1
    [2,4,6] # accross 2
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(spot)
    spot.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token  
  end
  
  def position_taken?(position)
    @board[position] != " "
  end
  
  def valid_move?(position)
    if position <= @board.length
      if !position_taken?(position)
        true 
      end
    end
  end
  
  def turn_count
    9 - (@board.count " ")
  end
  
  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Please enter a position from 1 to 9:"
    input = gets.strip
    position = input_to_index(input)
    
    if position >= 0 && valid_move?(position)
      move(position, current_player)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |i|
      if @board[i[0]] != " "
        if @board[i[0]] == @board[i[1]] &&
          @board[i[1]] == @board[i[2]]
          return i
        end
      end
    end
    return false
  end
  
  def full?
    (@board.count "X") + (@board.count "O") == 9
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    full? || won? || draw?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end
  
  def play
    until over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
  
end