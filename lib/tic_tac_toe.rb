class TicTacToe 
  
  def initialize
    @board = Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
        [0,1,2], # Top row
        [3,4,5], # Middle row
        [6,7,8], # Bottom row
        [0,3,6], # Left column
        [1,4,7], # Middle column
        [2,5,8], # Right column
        [0,4,8], # Left diagonal
        [2,4,6], # Right diagonal
        ]
  
  
  def display_board
    puts" #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts"-----------"
    puts" #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts"-----------"
    puts" #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1
  end
  
  def move(index, player)
    @board[index] = player
  end



  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil
      return false
    else
      return true
    end
  end


  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      return true
    end
  end



  def turn
    player = current_player
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end



  def turn_count
    counter = 0
    @board.each do |element|
      if element != " " && element != "" && element != nil
        counter += 1 
      end
    end
    counter
  end



  def current_player
    counter = turn_count
    if counter.even?
      return "X"
    else
      return "O"
    end
  end
  
  
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
    
      position_1 = @board[win_index_1] 
      position_2 = @board[win_index_2] 
      position_3 = @board[win_index_3] 
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        return win_combination
      elsif 
        position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end
    if false
      return false
    end
    #binding.pry
  end

    
  def full?  
    if @board.include? " "
      false
    else
      true
    end
  end
  
  
  def draw?
    if full? && !won?
      true
    elsif won?
      false
    else
      false
    end
  end
  
  
  def over?
    won? || draw? || full?
  end
   
   
  def winner
    if won?
      @board[won?[0]]
    elsif !won?
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
