class TicTacToe 
  def initialize
    @board = board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end 

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 4, 8],
    [2, 4, 6],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user)
    user.to_i - 1
  end

  def move(index, token = "X")
    @board[index] = token 
  end

  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] == nil 
      return false 
    else
      return true 
    end 
  end

  def valid_move?(index)
      if index.between?(0, 8) && position_taken?(index) == false 
        return true 
      else 
        return false 
      end
    end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    user = input_to_index(input)
    if valid_move?(user)
      move(user, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count 
    counter = 0 
    @board.each do |space|
      if space == "X" || space == "O"
        counter += 1 
      end 
    end 
    return counter 
  end 
  
  def current_player
    if turn_count % 2 == 0
      return "X"
    else 
      return "O"
    end 
  end 

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      position_taken?(combo[0])
    end 
  end 
  
  def full?
    if @board.any?{|i| i == " " || nil}
      return false 
    end 
    if @board.all?{|space| space == "X" || "O"}
      return true 
    end 
  end 
  
  def draw?
    full? && !won?
  end 
  
  def over?
    won? || draw? || full?
  end 
  
  def winner
    if winning_combo = won?
      @board[winning_combo[0]]
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