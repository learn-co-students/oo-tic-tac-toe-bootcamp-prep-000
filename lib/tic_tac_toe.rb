class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #first column
    [1,4,7], #middle column
    [2,5,8], #last column
    [0,4,8], #left diagonal
    [2,4,6] #right diagonal
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if position_taken?(index) == false && index.between?(0,8)
      true
    else
      false || nil
    end
  end

  def turn
    puts "Please enter 1-9:"
    integer = gets.strip
    index = input_to_index(integer)
  
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn #recursion
    end
  end

  def turn_count
    turns = 0
    @board.each do |integer|
      if integer == 'X' || integer == 'O'
        puts "#{turns} played."
        turns += 1
      end
    end
    "#{turns}".to_i
  end

  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
    
  def won?
    WIN_COMBINATIONS.find do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        win_combination
      elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
        win_combination
      else
        false
      end
    end
  end
  
  def full?
    @board.all? {|i| i == "X" || i == "O"}
  end

  def draw?
    if full? && !(won?)
      true
    else
      false
    end
  end

  def over?
    won? || draw? || full?
  end

  def winner
    WIN_COMBINATIONS.find do |win_combination|
      if @board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X"
        return "X"
      elsif @board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O"
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
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
