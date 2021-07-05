class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
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
  end
  
  def move(user_input, token = "X")
    @board[user_input] = token
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
    @board.each do |cell|
      if cell == "X" || cell == "O"
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
    WIN_COMBINATIONS.each do |wincombo|
      if @board[wincombo[0]] == "X" && @board[wincombo[1]] == "X" && @board[wincombo[2]] == "X"
        return wincombo
      elsif @board[wincombo[0]] == "O" && @board[wincombo[1]] == "O" && @board[wincombo[2]] == "O"
        return wincombo
      end 
    end
    return nil
  end 

  def full?
    @board.each do |value|
      if value == " "
        return false
      end 
    end
    return true
  end 

  def draw?
    if won?
      return false
    elsif full?
      return true
    else 
      return false
    end 
  end 

  def over?
    if draw?
      return true
    elsif won?
      return true
    else 
      false
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
    
    while over? == false
      turn
    end 
    
    if won?
      champ = winner
      puts "Congratulations #{champ}!"
    elsif draw?
      puts "Cat's Game!"
    end 

  end
  
end 