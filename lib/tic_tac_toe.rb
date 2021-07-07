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
    input.to_i - 1 
  end
  
  def move(index, char = "X")
    @board[index] = char
  end
  
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      return true
    else
      return false
    end
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
    @board.each do |i|
      if i == "X" || i == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  
  def won?
    #iterate through winning combos and see if any of them are present on board
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] =="X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      end
      
      if @board[combo[0]] =="O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    return false
  end
  
  def full?
    counter = -1  
    @board.all? do |i|
      position_taken?(counter += 1)    
    end
  end
  
  def draw?
    if !won?
      if full?
        return true
      else
        return false
      end
    else
      return false
    end
  end
  
  def over?
    if won? || full? || draw?
      return true
    else
      return false
    end
  end
  
  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
 


end