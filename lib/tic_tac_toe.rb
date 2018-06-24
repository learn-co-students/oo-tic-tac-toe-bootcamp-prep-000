class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
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
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    turns = 0
    @board.each do |counter|
      if counter == "X" || counter == "O"
        turns += 1
      end
    end
    turns
  end
  
  def current_player
    turns = turn_count
    if turns % 2 == 0
      player = "X"
    else
      player = "O"
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
  
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Left column
    [1,4,7], # Middle column
    [2,5,8], # Right column
    [0,4,8], # Left diagonal
    [2,4,6], # Right diagonal
  ]
  
  def won?
    won = FALSE
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        won = combo
      elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        won = combo
      end
    end
    won
  end
  
  def full?
    @board.all?{|item| item == "X" || item == "O"}
  end
  
  def draw?
    full = full?
    won = won?
    if full && !(won)
      TRUE
    elsif won
      FALSE
    elsif !(full) && !(won)
      FALSE
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
    winner = nil
    won = won?
    if won != FALSE
      if @board[won[0]] == "X"
        winner = "X"
      else
        winner = "O"
      end
    end
    winner
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