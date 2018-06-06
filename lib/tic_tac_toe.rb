class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2], #top row  
    [3,4,5], #mid row
    [6,7,8], #bottom row
    [0,4,8], #diag top left
    [2,4,6], #diag top right
    [0,3,6], #left col
    [1,4,7], #mid col
    [2,5,8]  #right col
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
  
  def move(index, token)
    @board[index] = token
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
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    @board.select{|position| position == "X" || position == "O"}.length
  end
  
  def current_player
    turn_count.even? ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_array| #iterate through win conditions
      if position_taken?(win_array[0]) #check if first position of win condition is taken
        token = @board[win_array[0]] #get the token from the first position to check
        if win_array.all? do |position| #check if all positions in the win condition have the token
            @board[position] == token
          end
          return win_array #return the win condition
        end  
      end
    end
    false
  end
  
  def full?
    @board.all?{|position| position == "X" || position == "O"}
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    winning_board = won?
    if winning_board
      @board[winning_board[0]]
    end
  end
  
  def play
    puts "Welcome to Tic Tac Toe!"
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