class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],  # Top row 
    [3, 4, 5],  # Middle row 
    [6, 7, 8],  # Bottom row
    [0, 3, 6],  # Left column
    [1, 4, 7],  # Middle column
    [2, 5, 8],  # Right colum
    [0, 4, 8],  # Across (left to right)
    [2, 4, 6]   # Across (right to left)
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

  def move(index, token)
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else
      turn
    end
  end

  def turn_count
    count = 0 
    index = 0
    @board.each do |position|
      count += 1 if position_taken?(index) 
      index += 1 
    end
    count 
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      win_index_1 = combination[0]
      win_index_2 = combination[1]
      win_index_3 = combination[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
        
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O") 
          return combination
      end 
    end
    return false
  end 

  def full?
    @board.all? do |position|
      position != " " && position != "" && position != nil
    end
  end 

  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    winner = won?
    winner ? @board[winner[0]] : nil
  end

  def play
    until over?
      turn
    end
    if won? 
      puts "Congratulations #{winner}!" 
    else 
      puts "Cat's Game!"
    end 
  end
end