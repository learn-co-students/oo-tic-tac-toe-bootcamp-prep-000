class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end 
  
  WIN_COMBINATIONS = [
    #rows
    [0,1,2],
    [3,4,5],
    [6,7,8],
    #columns
    [0,3,6],
    [1,4,7],
    [2,5,8],
    #Diagonals
    [0,4,8],
    [2,4,6]
    ]
    
    def display_board
      puts " #{@board[0]} | #{@board[1]} | #{@board[2]} |"
      puts "------------"
      puts " #{@board[3]} | #{@board[4]} | #{@board[5]} |"
      puts "------------"
      puts " #{@board[6]} | #{@board[7]} | #{@board[8]} |"
    end 

    def input_to_index(input)
      index = input.to_i
      return index-1
    end 
    
    
    def move (index, token = "X")
      @board[index] = token
    end 
  
    def position_taken?(index)
      if @board[index] == " "
        return false
       
     else 
       return true
     end 
    end 
    
    def valid_move?(index)
      if position_taken?(index) == true || index < 0 || index > 8
        return false
      else 
        return true
      end 
    end 
    
    def turn
      puts "Position 1-9"
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
      @board.each do |spot|
        if spot == "X" || spot == "O"
          counter+=1
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
      WIN_COMBINATIONS.each do |combo|
        if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]]!= " "
          return combo
        end 
      end 
      return false
    end 
    
    def full?
      @board.all? do |spot|
        spot == "X" || spot == "O"
      end 
    end 
    
    def draw?
      if won? || !full?
        return false
      else 
        return true
      end 
    end 
    
    def over?
      if full? || won? || draw?
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
      until over? 
      turn
    end 
    if won?
      puts "Congratulations #{winner}!"
    end 
    else if draw?
      puts "Cat's Game!"
    end 
  end 
 
        

  
end 