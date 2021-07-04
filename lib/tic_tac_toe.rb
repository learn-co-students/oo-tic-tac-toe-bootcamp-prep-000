class TicTacToe
  
  def initialize()
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # First column
  [1,4,7], # Second column
  [2,5,8], # Third column
  [0,4,8], # Left diagonal
  [2,4,6], # Right diagonal
  # ETC, an array for each win combination
  ]

  def display_board()
    board = @board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-----------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-----------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, character = "X")
    board = @board
    board[index] = character
  end
  
  def position_taken?(index)
    board = @board
    !(board[index].nil? || board[index] == " ")
  end

  def valid_move?(index)
    board = @board
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count()
    board = @board
    counter = 0
    board.each do |count|
      if count == "X" || count == "O"
        counter += 1
      end
    end
    return counter
  end
  
  def current_player()
    board = @board
    turnCount = turn_count()
    if turnCount % 2 == 0
      return "X"
    else
      return "O"
    end
  end
  
  def turn()
    board = @board
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    character = current_player()
    if valid_move?(index)
      move(index, character)
      display_board()
    else
      turn()
    end
  end
  
  def won?()
    board = @board
    WIN_COMBINATIONS.each do |win|
      win_index_1 = win[0]
      win_index_2 = win[1]
      win_index_3 = win[2]
      position_1 = board[win_index_1] 
      position_2 = board[win_index_2] 
      position_3 = board[win_index_3] 
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") 
        return win
      elsif (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win
      else
        false
      end
    end
    if board == nil
      return false
    end
  end

  def full?()
    board = @board
    if board.find {|i| i == " " || i == nil}
      return false
    else
      return true
    end
  end
  
  def draw?()
    if full?() && !won?()
      return true
    else
      return false
    end
  end
  
  def over?() 
    board = @board
    if won?() || draw?() || full?()
      return true
    else
      return false
    end
  end

  def winner()
    board = @board
    if win_combination = won?()
      board[win_combination.first]
    end
  end
  
  def play()
    until over?() 
      current_player()
      turn()
    end
    if won?() 
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end
  
end