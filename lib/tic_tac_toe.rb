class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]]
    
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
    [2,4,6]]
  
  def display_board
    board = @board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "-"*11
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "-"*11
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end
  
  def input_to_index(input)
    input = input.to_i - 1
  end
  
  def move(index, character)
    board = @board
    board[index] = character
  end
  
  def position_taken?(index)
    board = @board
    val = true
    if (board[index] == " ") || (board[index] == "") || (board[index] == nil)
      val = false
    end
    val
  end
  
  def valid_move?(index)
    index.between?(0, 8) == true && position_taken?(index) == false
  end
  
  def turn
    board = @board
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
    board = @board
    turns = []
    board.each do |item|
      if item != " " && item != "" && item != nil
        turns.push(item)
      end
    end
    turns.size
  end
  
  def current_player
    #board = @board
    count = turn_count + 1
    current = count.even? == true ? "O" : "X"
  end
  
  def won?
    board = @board
    answer = false
    WIN_COMBINATIONS.each do |row|
      win_index_1 = row[0]
      win_index_2 = row[1]
      win_index_3 = row[2]
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      
      if position_1 == "X" && position_2 == "X" && position_3 == "X"
        answer = row
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        answer = row
      end
    end
    answer
  end
  
  def full?
    board = @board
    !board.include?(" ")
  end
  
  def draw?
    #board = @board
    full? && !won?
  end
  
  def over?
    #board = @board
    won? || draw? || full?
  end
  
  def winner
    board = @board
    if won?
      board[won?[0]]
    end
  end
  
  def play
    while !over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end