class TicTacToe
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
  
  

WIN_COMBINATIONS=[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [2,4,6],
  [0,3,6],
  [1,4,7],
  [2,5,8]]
 
  def input_to_index(arg)
    arg = arg.to_i
    arg = arg - 1
  end
  
  def position_taken?(index)
    @board[index]=="X" || @board[index]=="O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end 

  def move(index, player_char)
      @board[index] = player_char
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
  
  def won?
        WIN_COMBINATIONS.each do |combination| 
          win_index_1 = combination[0]
          win_index_2 = combination[1]
          win_index_3 = combination[2]
          if @board[win_index_1] == "X" && @board[win_index_2] == "X" && @board[win_index_3] == "X" || @board[win_index_1] == "O" && @board[win_index_2] == "O" && @board[win_index_3] == "O"
          return combination
       end 
        end 
        false 
    end
   
  def full?
    @board.all?{|token| token == "X" || token == "O"}
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw? || full?
  end

  def winner
    if combo = won?
    return @board[combo[0]]
  end 
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



  