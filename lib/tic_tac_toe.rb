class TicTacToe
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
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
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if position_taken?(index)
    return FALSE
    elsif !(index.between?(0, 8))
      return FALSE
    else
      return TRUE
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    counter = 9
    @board.each do |space|
      if space == " "
        counter -= 1
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
    @win_combo = []
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
       
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
    
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        @win_combo = [position_1, position_2, position_3]
        return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        @win_combo = [position_1, position_2, position_3]
        return win_combination
      else
        FALSE
      end
    end
    return FALSE
  end
  
  def full?
    if @board.select{|i| i == " "} == []
      TRUE
    else
      FALSE
    end
  end
  
  def draw?
    if won?
      FALSE
    elsif full?
      TRUE
    else
      FALSE
    end
  end
  
  def over?
    if won? || draw?
      TRUE
    else
      FALSE
    end
  end
  
  def winner
    if won?
      return @win_combo[0]
    else
      return nil
    end
  end
  
  def play
    until over?
      turn
    end
    if winner == "X"
      puts "Congratulations X!"
    elsif winner == "O"
      puts "Congratulations O!"
    else
      puts "Cat's Game!"
    end
  end
end