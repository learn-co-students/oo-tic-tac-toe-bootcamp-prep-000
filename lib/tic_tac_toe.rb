class TicTacToe
  
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
  
  def initialize(board = nil)
    @board = Array.new(9, " ")
  end 
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 
  
  def input_to_index(string)
    index = string.to_i - 1 
  end 
  
  def move(index, char)
    @board[index] = char
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if index > 8 || index < 0
      false
    elsif position_taken?(index) == false 
      true 
    else 
      false
    end 
  end
  
  def turn_count
    count = 0 
    @board.each do |space|
     if space != " "
       count += 1
     end 
    end 
    return count
  end 
  
  def current_player
    count = turn_count
    if count == 0 
      "X"
    elsif count % 2 == 0 
      "X"
    else 
      "O"
    end 
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
  
  def won?
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
          return win_combination
      end 
    end
    return false
  end 
  
  def full?
    if @board.include?(" ")
      false
    else 
      true 
    end 
  end 

  def draw?
    if full? && !won?
        true
    else
      false
    end 
  end 
  
  def over?
    if won? || full? || draw?
      true
    else
      false
    end
  end
  
  def winner
    index = won?
    if over? && won?
      if @board[index[0]].include?("X")
        "X"
      elsif @board[index[0]].include?("O")
        "O"
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
      token_winner = winner
      puts "Congratulations #{token_winner}!"
    elsif draw?
      puts "Cat's Game!"
    end 
  end 
end 