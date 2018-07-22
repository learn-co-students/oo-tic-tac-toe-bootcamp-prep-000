class TicTacToe
  def initialize(board = nil)
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS =  [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1 
  end
  
  def move(index,character)
    @board[index] = character
  end
  
  def position_taken?(index)

    taken = nil
    if (@board[index] ==  " " || @board[index] == "" || @board[index] == nil)
      taken = false
    else
      taken = true
    end
  end
  
  def valid_move?(index)
    if position_taken?(index) || !(index.between?(0,8))
      false
    else
      true
    end
  end

  def turn()
    puts "Enter a number from 1-9:"
    number = gets.strip
    index = input_to_index(number)
    if valid_move?(index)
      character = current_player()
      move(index, character)
      display_board()
    else
      turn()
    end 
  end
  
  def turn_count()
    counter = 0
    @board.each do |character|
      if character == "X" || character == "O"
        counter += 1
      end 
    
    end 
    return counter
  end
  
  def current_player()
    if turn_count() % 2 == 0
      return "X"
    else 
      return "O"
    end
  end
  
  def won?()
  winner = nil
  WIN_COMBINATIONS.each do |combo|
    if combo.all? {|idx| @board[idx] == "X"}
      winner = combo
    elsif combo.all? {|idx|@board[idx] == "O"}
      winner = combo
    else
      false 
    end
  end
  if winner != nil
    winner
  else
    false
  end
end


  def winner()
    winner = nil
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|idx| @board[idx] == "X"}
        winner = "X"
      elsif combo.all? {|idx| @board[idx] == "O"}
        winner = "O"
      else
      end
    end
    winner
  end
  
  
  
  
  def full?()
    @board.all?{ |token| token == "X" || token == "O"}
  end
  
  def draw?()
    if full?() && !(won?())
      true
    else
      false 
    end
  end
  
  
   def over?()
    if full?() || won?() || draw?()
      true
    else
      false
    end
  end
  
  
  
  def play()
    until over?()
      turn()
    end
    
    if won?()
      puts "Congratulations #{winner()}!"
    elsif draw?()
      puts "Cat's Game!"
    end
  end
  
        
end