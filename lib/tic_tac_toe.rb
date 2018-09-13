class TicTacToe
  WIN_COMBINATIONS =[
    [0,1,2], #top row
    [3,4,5],
    [6,7,8],
    [0,3,6],  #left Column
    [1,4,7],
    [2,5,8],
    [0,4,8], #left diagnol
    [2,4,6]
  ]
  def initialize(board = Array.new(9," "))
    @board = board
  end
  
  # Helper Methods
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def move(index, current_player_token)
    @board[index] = current_player_token
  end
  def position_taken?(index)
  !(@board[index].nil? || @board[index] == " ")
  end
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    counter = 0
    @board.each do |token|
      if token == "X" || token =="O"
        counter +=1
      end
    end
  counter
  end
  
  def current_player
    if (turn_count + 1) %2 == 0
      "O"
    else
      "X"
    end
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
  #returns the wining combination array or nil if no winner
  def won?
    sam_ex = []
    sam_oh = []
    i = 0
    @board.each do |index|
      if index == "X"
        sam_ex.push(i)
      elsif index == "O"
        sam_oh.push(i)
      end
      i+=1
    end
    WIN_COMBINATIONS.each do |combination|
      if combination&sam_oh == combination || combination&sam_ex == combination
      return  combination
      end
    end
    nil
  end
  
  def full?
    @board.all?{|token| token == "X" || token =="O"}
  end 
  
  #returns true if the game ended in a draw
  def draw?
    if full? && !won?
      true
    else
      false
    end
  end
  
  #returns true if the game ended in a draw
def draw?
  if full? && !won?
    true
  else
    false
  end
end

  #returns true if game is a draw or someone won
  def over?
    if draw? || won?
      true
    else
      false
    end
  end
  
  #returns an X or an O depending on which one won
  def winner
    won?
    if won?
     @board[won?[0]]
    end
  end
  
  #play loop
  def play
    while !over?
      turn
    end
      if draw?
      puts "Cat's Game!"
    else over?
      puts "Congratulations #{winner}!"
    end
  end

  
end
  

