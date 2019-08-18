class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
    [0, 1, 2], #Top Row 
    [3, 4, 5], #Middle Row 
    [6, 7, 8], #Bottom Row 
    [0, 3, 6], #First Column
    [1, 4, 7], #Second Column
    [2, 5, 8], #Third Column
    [0, 4, 8], #Diagonal 1 
    [2, 4, 6], #Diagonal 2 
    
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    index = user_input.to_i - 1 
    index 
  end
  
  def move(index, current_player = "X")
    @board[index] = current_player
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
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
     @board.each do | place |
      if place == "X" || place == "O"
       counter += 1 
      end
    end 
   counter
  end
  
    def current_player
      if turn_count % 2 == 0 
       "X"
      else
      "O"
      end
     end
     
  def won?
    WIN_COMBINATIONS.detect do |combos|
     @board[combos[0]] == @board[combos[1]] && @board[combos[1]] == @board[combos[2]] &&
     position_taken?(combos[0])
   end
  end
  
  def full?
    @board.all? do |spot|
      spot == "X" || spot == "O"
    end 
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
    if winner = won?
      @board[winner.first]
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