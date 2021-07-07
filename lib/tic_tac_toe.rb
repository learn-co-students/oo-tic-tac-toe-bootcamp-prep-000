class TicTacToe
  
  def initialize
    @board = Array.new(9, " ") # make new array with 9 empty strings
  end
  
  WIN_COMBINATIONS = [
    # horizontal
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    # vertical
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    # diagonal
    [0, 4, 8],
    [2, 4, 6],
    ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1 
  end
  
  def move(index, character)
    @board[index] = character
  end
  
  def position_taken?(index) 
    if @board[index] == " "
      false
    else
      true
    end
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
    count = 0
    @board.each do |turn|
      if turn == "X" || turn == "O"
        count += 1
      end
    end
    count
  end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def won?
    # for each win_combination in WIN_COMBINATIONS 
    WIN_COMBINATIONS.each do |win_combination|
      # copypasta
      win_index_1 = win_combination[0] 
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
  
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
  
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination 
      end
    end
    return false # empty board
  end
  
  def full?
    @board.all? { |space| space != "" && space != " " }
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || full? || draw?
  end
  
  def winner
    if won?
      @board[won?.first]
    else
      nil
    end
  end
  
  def play
    until over?
      turn
    end
    if won? # calls on won? and returns who won
      puts "Congratulations #{winner}!"
    else # cause a draw is determined in over? note to self in the future: that was not a question
      puts "Cat's Game!"
    end
  end
end