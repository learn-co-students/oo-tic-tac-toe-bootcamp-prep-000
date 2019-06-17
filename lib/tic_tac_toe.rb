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
  [2,4,6],
  [0,4,8]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    (input.to_i - 1)
  end
  
  def position_taken?(index)
    (@board[index] == "X" || @board[index] == "O")
  end
  
  def valid_move?(index)
    (index.between?(0,8) && !position_taken?(index))
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def move(index, character = "X")
    @board[index] = character
  end
  
  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
    until valid_move?(index)
      puts "Please enter 1-9:"
      index = input_to_index(gets.strip)
    end
    move(index, current_player)
    display_board
  end
  
  def won?
  WIN_COMBINATIONS.each do |condition|
    if @board[condition[0]] == "X" && @board[condition[1]] == "X" && @board[condition[2]] == "X"
      return condition
    elsif @board[condition[0]] == "O" && @board[condition[1]] == "O" && @board[condition[2]] == "O"
      return condition
    end
   end
   return false
  end

  def full?
    array_of_filled = @board.select{|i| i == "X" || i == "O"}
    if array_of_filled.size == 9
      return true
    else
      return false
    end
  end
  
  def draw?
    (full? && !won?)
  end
  
  
  def over?
    (full? || won? || draw?)
  end
  
  def winner
    if won? != false
      combination = won?
      winner = @board[combination[0]]
      return winner
    end
    return nil
  end
  
  def play
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  
end