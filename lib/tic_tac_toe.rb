class TicTacToe
  
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],          #rows 
    [3,4,5],
    [6,7,8],
    
    [0,3,6],          #columns
    [1,4,7],
    [2,5,8],
    
    [0,4,8],          #diagonals
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
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if index <= @board.length - 1 && index >= 0 && position_taken?(index) == false
      return true
    else
      return false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == true
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |i|
      if position_taken?(@board.index(i))
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
    WIN_COMBINATIONS.detect do |combo|
      positions = []
      counter = 0
    
      combo.each do |i|
        positions[counter] = i
        counter += 1
      end
  
      positions.all? do |n|
        position_taken?(n)
      end
    
      if @board[positions[0]] == "X"
        positions.all? do |m|
          @board[m] == "X"
        end
      elsif @board[positions[0]] == "O"
        positions.all? do |q|
          @board[q] == "O"
        end
      end
    end
  end

  def full?
    @board.all? do |i|
      position_taken?(@board.index(i))
    end
  end
  
  def draw?
    if won?
      return false
    else
      if full?
        return true
      else
        return false
      end
    end
  end
  
  def over?
    if won? || full? || draw?
      return true
    end
  end
  
  def winner
    if won?
      return @board[won?[0]]
    elsif won? == nil
      return nil
    end
  end
  
  def play 
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat\'s Game!"
    end
  end



  
end