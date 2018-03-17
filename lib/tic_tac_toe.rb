class TicTacToe
  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i - 1 
  end
  
  def move(index, character = "X")
    @board[index] = character
  end
  
  def position_taken?(index)
    if (@board[index] == " " || @board[index] == "" || @board[index] == nil)
      return false
    elsif (@board[index] == "X" || @board[index] == "O")
      return true
    end
  end
  
  def valid_move?(index)
    if (index.between?(0, 8) && !(position_taken?(index)))
    return true
    end
  end
  
  def turn_count
    counter = 0 
    @board.each do |i|
      if (i == "X" || i == "O")
        counter += 1
      end
    end
    return counter
  end
  
  def current_player
    if (turn_count % 2 == 0)
      return "X"
    else 
      return "O"
    end
  end
  
  def turn
    puts "Please enter 1-9."
    input = gets 
    index = input_to_index(input)
    character = current_player
    if (valid_move?(index))
      move(index, character)
      display_board
    else
      turn 
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    position_1 = @board[win_index_1] 
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3] 
    if (position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combo
    end
    end
    false
  end
  
  def full?
    if (@board.all? {|i| i == "X" || i == "O"})
      return true
    end
  end
  
  def draw?
    if (full? && won? == false)
      return true
    end
  end
  
  def over?
    if (full? || won? || draw?)
      return true
    end
    false
  end
  
  def winner
    WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]
    position_1 = @board[win_index_1] 
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3] 
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return "X"
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return "O"
      end
    end
    nil
  end
  
  def play
    until (over?) do
      turn
    end
    if (draw?)
      puts "Cat's Game!"
      return
    end
    if (winner == "X")
      puts "Congratulations X!"
      return 
    elsif (winner == "O")
      puts "Congratulations O!"
      return 
    end
  end
end

