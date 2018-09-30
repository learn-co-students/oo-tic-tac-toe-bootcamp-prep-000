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
  
  WIN_COMBINATIONS = [
  [0, 1, 2], # top row
  [3, 4, 5], # middle row
  [6, 7, 8], # bottom row
  [0, 3, 6], # left column
  [1, 4, 7], # middle column
  [2, 5, 8], # right column
  [0, 4, 8], # diagonal 0-8
  [2, 4, 6]# diagonal 2-6
  ]

  def play
    while
      !over?
      turn
    end
    if 
      won?
      puts "Congratulations #{winner}!"
    elsif
      draw?
      puts "Cat's Game!"
    end
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end 

  def move(index, current_player)
    @board[index] = current_player
  end
  
  def valid_move?(index)
    index.between?(0, 8) && !position_taken?(index)
  end

  def turn
    puts "Please enter 1-9:"
    user_input = gets.strip
    index = input_to_index(user_input)
      if 
        valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
  end
  
  def position_taken?(index)
    if
      @board[index] == "X" || @board[index] == "O"
      true 
    else
      false
    end
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def won?
    WIN_COMBINATIONS.find do |index|
      @board[index[0]] == @board[index[1]] &&
      @board[index[1]] == @board[index[2]] &&
      position_taken?(index[0])
    end 
  end 
  
  def full?
    if @board.find {|index| index == "" || index == " " || index == nil}
    false
  else 
    true
    end
  end
  
  def draw?
    if won?
      false
    else 
      full?
    end
  end
 
  def over?
    if won? ||  draw?
      true
    else 
      false    
    end
  end
 
  def winner
    if
      winner = won?
      @board[winner[0]]
    else
      nil
    end
  end
  
end