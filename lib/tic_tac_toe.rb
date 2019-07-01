class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],
    [6,7,8], 
    [0,3,6], 
    [1,4,7], 
    [2,5,8], 
    [6,4,2], 
    [0,4,8]  
  ]
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
 
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
 
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input) input.to_i - 1 end
    
  def position_taken?(index) @board[index] != " " end
    
  def valid_move?(index) index >= 0 && index <= 8 && !position_taken?(index) end
    
  def turn_count
    @board.reject{|r| r == " "}.count 
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O" 
  end
    
  def won?
    WIN_COMBINATIONS.each do |wc| 
      if wc.all? { |wp| @board[wp] == "X" } || wc.all? { |wp| @board[wp] == "O" }
        return wc
      end
    end
    false
  end
  
  def full?
    !@board.include?(" ") 
  end
    
  def draw?
    full? && !won? 
  end
    
  def over?
    won? || draw?
  end
    
  def winner
    turn_count % 2 == 0 ? "O" : "X" if won?
  end
    
  def move(pos, mark = "X") 
    @board[pos] = mark 
  end
    
  def turn
    puts "Please enter 1–9."
    index = input_to_index(gets.strip)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end
  
  def play
    9.times do
      unless over?
        turn
      end
      if won?
          puts "Congratulations, #{winner}!"
      elsif draw?
        puts "Cat's game!"
      end
    end
  end
end

# game = TicTacToe.new(["X", " ", "X", "O", " ", "O", "O", "X", "X"])
# 
# game.display_board
# p game.won?