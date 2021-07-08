class TicTacToe
  
  def initialize (board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    #horizontal wins
     [0,1,2],
     [3,4,5],
     [6,7,8],
  
    #vertical wins
     [0,3,6],
     [1,4,7],
     [2,5,8],
  
    #diagonal wins
     [0,4,8],
     [2,4,6]
  
    ] #closes WIN_COMBINATIONS array
    
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end  #ends display_board
  

  def input_to_index (input)
    index = (input.to_i) - 1
  end 
  
  
  def move (index, team = "X")
    @board[index] = team
  end 
  
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end  
  
  def valid_move? (index)
    if ( position_taken?(index) == false ) && ( index.between?(0,8) ) 
        return true
    else
        return false
    end #ends if statement
  end #ends #valid_move?
  
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index (input)
    
    if valid_move? (index)
      move(index, current_player)
      display_board
    else
      turn
    end #ends if/else statement  
  end #ends #turn
  
  
  def turn_count
    counter = 0
    @board.each do |position|
      
        if position != " "
            counter += 1
        end #end if statement
        
    end #end .each iteration
    
    #return counter only before ending function
    return counter
  end  #ends #turn_count
  
  
  def current_player
    current_turn = turn_count
    
      if current_turn % 2 == 0
            return current_turn = "X"
            
      else 
            return current_turn = "O"
      end #end if/else statement
  end #ends #current_player  
  
  
  def won?
    #have to use if statement (unlike in the procedural tictactoe) because it should return combo. Not true or false.
    WIN_COMBINATIONS.find do |combo|
        if  
          @board[combo[0]] == @board[combo[1]] && #=> true
          @board[combo[1]] == @board[combo[2]] && # true
          position_taken?( combo[0] ) #true
        return combo
      
        end #ends if statement
    
    end #ends iteration
    
  end #ends #won?
  
  
  def full?
    @board.none? {|index| index == " "}
  end #ends #full?
  

  def draw?
    
    if (won? == nil) && (full? == true)
      return true
    else
      return false
    end #ends if/else statement
  end #ends #draw?  
  
  def over?
    if (won? != nil) || ( draw? == true ) || ( full? == true )
      return true
    else
      return false
    end #ends if/else statement
  end #ends #over?
  
  def winner
    winning_combo = ( won? )
    
    if winning_combo != nil
      if (@board[winning_combo[0]] == "X" )
        return "X"
      elsif (@board[winning_combo[0]] == "O" ) 
        return "O"
      end
    
    else
      return nil
    end #ends if/elsif/else statement
  end #ends #winner  
    
      
  def play
    
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end #end if/elsif statement
      
  end #ends #play 
  
end #ends "class TicTacToe"














