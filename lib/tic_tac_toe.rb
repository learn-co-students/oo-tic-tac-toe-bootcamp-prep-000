class TicTacToe
  
  #Begin game with empty board
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end
  
  def board=(board)
    @board = board
  end
  
  def board
    @board
  end
  
  WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]
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
  
  def move(index, current_player="X")
    @board[index] = current_player
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  
  def valid_move?(index)
    #index.between?(0,8) && position_taken?
    if position_taken?(index) then return false
    elsif index.between?(0, 8) then return true
    end
  end
  
   def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
    
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    @board.select{|position| position != " "}.count
  end
  
  def won?
    WIN_COMBINATIONS.find do |win_combo|
      @board[win_combo[0]] == @board[win_combo[1]] && 
      @board[win_combo[1]] == @board[win_combo[2]] && 
      position_taken?(win_combo[0])
    end
  end
  
  def full?
    @board.all?{|occupied| occupied != " "}
  end
  
  def draw?
    !won? && full?
  end

  def over?
    won? || full? || draw?
  end

  def winner
  WIN_COMBINATIONS.detect do |win_combo|
    if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
      return "X"
    elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
      return "O"
    else
      nil
    end
  end
  end
  
  def play
    until over?
      turn
    end
  
    if won?
      puts "Contratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end