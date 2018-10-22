class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #left column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [2, 4, 6], #diagonal right to left
  [0, 4, 8]  #diagonal left to right
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
  
  def move(index, character = "X")
    @board[index] = character
  end 
  
  def position_taken?(index)
    if @board[index] == "X" || @board[index] == "O"
      return true 
    else 
      return false
    end
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      return true
    else 
      return false 
    end
  end 
  
  def turn
    puts "Please enter a number 1-9: "
    inp = gets.strip
    ix = input_to_index(inp)
    char = current_player
    if valid_move?(ix)
      move(ix, char)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each do |i|
      if i == "X" || i == "O"
        count += 1
      end
    end
    return count
  end 
  
  def current_player
    if turn_count % 2 == 0 
      "X"
    else
      "O"
    end
  end 
    
  def won?
    WIN_COMBINATIONS.each do |comb|
      i1 = comb[0]
      i2 = comb[1]
      i3 = comb[2]
   
      pos1 = @board[i1]
      pos2 = @board[i2]
      pos3 = @board[i3]
   
      if pos1 == "X" && pos2 == "X" && pos3 == "X"
        return comb
      elsif pos1 == "O" && pos2 == "O" && pos3 == "O"
        return comb
      end
    end
    return false
  end
  
  def full?
    @board.all? do |arr|
      arr == "X" || arr == "O"
    end
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || full? || draw?
  end 
  
  def winner
    if won?
      arr = won?
      i = arr[0]
      if @board[i] == "X"
        return "X"
      elsif @board[i] == "O"
        return "O"
      end
    nil
    end
  end 
  
  def play
    until over?
      turn
      display_board
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end 
end 