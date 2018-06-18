class TicTacToe 
  
  WIN_COMBINATIONS = [
    [0, 1, 2], # Top row
    [3, 4, 5], # Middle row
    [6, 7, 8], # Botton row
    
    [0, 3, 6], # Left column
    [1, 4, 7], # Middle column
    [2, 5, 8], # Right column
    
    [0, 4, 8], # Left diagonal
    [2, 4, 6]  # Right diagonal
  ]
  
  def initialize
    @board = Array.new(9, " ")
  end

# ----------------------------------------------------------
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

# ----------------------------------------------------------

  def input_to_index(input)
    index = input.to_i - 1;
  end
  
  def move(index, player)
    @board[index] = player
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

# ---------------------------------------------------------------
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
    else
      puts "Invalid move. Please try again."
      turn
    end
  end
  
# ---------------------------------------------------------------

  def turn_count
    counter = 0;
    @board.each do |space|
      if(space == "X" || space == "O")
        counter += 1
      end
    end
    return counter
  end
  
  def current_player
    counter = turn_count
    if(counter % 2 == 0)
      return "X"
    else
      return "O"
    end
  end

# ---------------------------------------------------------------

  def won?
    WIN_COMBINATIONS.each do |combo|
      win_index_1 = combo[0]
      win_index_2 = combo[1]
      win_index_3 = combo[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3] 
      
      if (position_taken?(win_index_1) && position_taken?(win_index_2) && position_taken?(win_index_3)) && (position_1 == position_2) && (position_2 == position_3) && (position_1 == position_3)
        return combo
      end
    end
    return false
  end
  
# ---------------------------------------------------------------
  
  def full?
    is_full = @board.all? do |index|
      (index == "X" || index == "O")
    end
    return is_full
  end
  
# ---------------------------------------------------------------
  
  def draw?
    !won? && full?
  end

# ---------------------------------------------------------------

  def over?
    won? || full? || draw?
  end

# ---------------------------------------------------------------

  def winner
    if(over? && won?)
      combo = won?
      return @board[combo[0]]
    else
      return nil
    end
  end

# ---------------------------------------------------------------

  def play
    while !over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end