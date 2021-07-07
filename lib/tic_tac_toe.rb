class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
  [0, 1, 2], #Top row 
  [3, 4, 5], #Middle row 
  [6, 7, 8], #Bottom row
  [0, 3, 6], #Left column
  [1, 4, 7], #Middle column
  [2, 5, 8], #Right column
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

  def input_to_index(input)
    input = input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8) 
      TRUE
    else
      FALSE 
    end
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == TRUE
      move(index, current_player)
      return display_board
    else
      until valid_move?(index) == TRUE
        puts "Please enter 1-9:"
        input = gets.strip
        index = input_to_index(input)
      end
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |element|
      if element == "X" || element == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count.even? 
      return "X"
    else return "O"
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
    return FALSE 
  end

  def full?
    @board.all? do |index|
      if index == "O" || index == "X"
        TRUE
      else 
        FALSE
      end
    end
  end

  def draw?
    if !won? && full?
      return TRUE
    elsif !won?
      return FALSE
    elsif won?
      return FALSE 
    end
  end  

  def over?
  if won? || draw? || full?
    TRUE
  else 
    FALSE
  end
end

  def winner
    if !won?
      return nil
    else 
    win = won?
    char_win = win[0]
      if @board[char_win] == "X"
        return "X"
      elsif @board[char_win] == "O"
        return "O"
      end
    end
  end

  def play
    until over? == TRUE
      turn
    end
  
    if over? && !draw?
      puts "Congratulations #{winner}!"
    elsif draw? == TRUE 
      puts "Cat\'s Game!"
    end
  end
  
end