class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    if input.to_i.to_s == input
      index = input.to_i - 1
    else
      index = -1
    end
  end
    
  def move(index, symbol)
    @board[index] = symbol
  end
  
  def valid_move?(index)
    if index >= 0 && index < 9
      if !position_taken?(index)
        true
      else
        false
      end
    else
      false
    end
  end
    
  def position_taken?(index)
    if @board[index] == nil || @board[index] == "" || @board[index] == " "
      false
    else
      true
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if !valid_move?(index)
      turn
    else
      if current_player == "X"
        move(index, "X")
        display_board
      else
        move(index, "O")
        display_board
      end
    end
  end
  
  def turn_count
    num_of_turns = 0
    @board.each do |token|
      if token != " "
        num_of_turns += 1
      end
    end
    num_of_turns
  end
  
  def current_player
    if turn_count % 2 == 0
      token = "X"
    else
      token = "O"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
        return combo
      end
      if @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
        return combo
      end
    end
    false
  end 
  
  def full?
    if @board.any?{|position| position == " "}
      false
    else
      true
    end
  end
  
  def draw?
    if !won? && full?
      true
    else
      false
    end
  end
  
  def over?
    if won?|| full?|| draw?
      true
    else
      false
    end
  end
  
  def winner
    if over?
      winner = @board[won?[0]]
    else
      nil
    end
  end
  
  def play
    until over?
      turn
      display_board
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end