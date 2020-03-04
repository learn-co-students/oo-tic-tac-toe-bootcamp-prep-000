class TicTacToe
  def initialize(board = Array.new(9, " "))
    @board = board
  end
  WIN_COMBINATIONS = [
    [0,1,2], # Top
    [3,4,5], # Middle
    [6,7,8], # Bottom
    [0,4,8], # L->R diag 
    [2,4,6], # R->L diag 
    [0,3,6], # L column
    [1,4,7], # Centre column
    [2,5,8]  # R column
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
  
  def move(index,token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    if @board[index] == " "
      return false 
    else
      return true 
    end
  end
  def valid_move?(index)
    if index.between?(0,8) && !(position_taken?(index))
      return true
    else
      return false
    end
  end
        
  def turn_count
      @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
      turn_count % 2 == 0 ? @token = "X" : @token = "O"
  end
  
  def turn
  puts "Please enter 1-9:"
  input = gets.strip
  @index = input_to_index(input)
    if valid_move?(@index)
      current_player
      move(@index,@token)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combos|
    @board[combos[0]] == @board[combos[1]] && @board[combos[1]] == @board[combos[2]] && position_taken?(combos[0])
    end
  end
  
  def full?
    @board.all? {|position| position == "X" || position == "O"}
  end
  
  def draw?
    full? ? (won? ? false : true) : false
  end
  
  def over?
    won? || draw? ? true : false
  end
  
  def winner
    wincombo = won?
    wincombo ? @board[wincombo[0]] : wincombo
  end
  
  def play

    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
end
  
