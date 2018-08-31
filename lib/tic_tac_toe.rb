class TicTacToe
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]
    
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(input)
    num = input.to_i
    index = num - 1
  end

  def move(index, value = "X")
    @board[index] = value
  end 
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      true
    else
      false 
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      true 
    else
      false 
    end
  end
    
  def turn 
    puts "Pick a number between 1-9:"
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      puts "Ivalid Move. Try Again"
      turn
    end
  end 
  
  def turn_count
    counter = 0 
    @board.each do |x|
      if x == "O" || x == "X"
        counter += 1 
      end
    end
    counter
  end
 
  
  def current_player
    if turn_count.even?
      "X"
    else 
      "O" 
    end 
  end
  
  def won?
    if @board[0] == "X" && @board[1] == "X" && @board[2] == "X"
      WIN_COMBINATIONS[0]
   
    elsif @board[0] == "O" && @board[1] == "O" && @board[2] == "O"
      WIN_COMBINATIONS[0]
    
    elsif @board[3] == "X" && @board[4] == "X" && @board[5] == "X"
      WIN_COMBINATIONS[1]
    
    elsif @board[3] == "O" && @board[4] == "O" && @board[5] == "O"
      WIN_COMBINATIONS[1]
    
    elsif @board[6] == "X" && @board[7] == "X" && @board[8] == "X"
      WIN_COMBINATIONS[2]
    
    elsif @board[6] == "O" && @board[7] == "O" && @board[8] == "O"
      WIN_COMBINATIONS[2]
    
    elsif @board[0] == "X" && @board[3] == "X" && @board[6] == "X"
      WIN_COMBINATIONS[3]
    
    elsif @board[0] == "O" && @board[3] == "O" && @board[6] == "O"
      WIN_COMBINATIONS[3]
    
    elsif @board[1] == "X" && @board[4] == "X" && @board[7] == "X"
      WIN_COMBINATIONS[4]
    
    elsif @board[1] == "O" && @board[4] == "O" && @board[7] == "O"
      WIN_COMBINATIONS[4]
    
    elsif @board[2] == "X" && @board[5] == "X" && @board[8] == "X"
      WIN_COMBINATIONS[5]
    
    elsif @board[2] == "O" && @board[5] == "O" && @board[8] == "O"
      WIN_COMBINATIONS[5]
    
    elsif @board[0] == "X" && @board[4] == "X" && @board[8] == "X"
      WIN_COMBINATIONS[6]
    
    elsif @board[0] == "O" && @board[4] == "O" && @board[8] == "O"
      WIN_COMBINATIONS[6]
    
    elsif @board[2] == "X" && @board[4] == "X" && @board[6] == "X"
      WIN_COMBINATIONS[7]
    
    elsif @board[2] == "O" && @board[4] == "O" && @board[6] == "O"
      WIN_COMBINATIONS[7]
    
    else
      false
    end
  end 
  
  def full?
    @board.all? do |x|
      x == "X" || x == "O"
    end
  end
  
  def draw?
    if full? && !won?
      return true 
    else 
      false 
    end 
  end 
  
  def over?
    if draw? || won?
      return true 
    else 
      false 
    end 
  end 
  
  def winner 
    if won?
      won?.each do |x|
        if @board[x] == "X"
          return "X"
        else
          return "O"
        end
      end 
    else 
      nil
    end 
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


#def position_taken?(board, index)
#  !(board[index].nil? || board[index] == " ")
#end


