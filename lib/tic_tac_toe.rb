class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
                      [0,1,2], #ROW
                      [3,4,5],
                      [6,7,8],
                      
                      [0,3,6], #COL
                      [1,4,7],
                      [2,5,8],
                      
                      [2,4,6],  #D
                      [0,4,8]
                      ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input = user_input.to_i - 1
  end
  
  
  def move(index, player="X")
    @board[index] = player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def current_player
    player = turn_count.even? ? "X" : "O"
  end
  
  def turn_count
    count = 0 
    @board.each do |b|
      if b == "X" || b == "O"
        count += 1 
      end
    end
    count
  end
  
  def turn
   
    puts "Please enter 1-9:"
    user_input = gets.strip
    
    index = input_to_index(user_input)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end
  
  def play
    until over?
      turn
    end
    
    if won?
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |wi|
      index_1 = wi[0]
      index_2 = wi[1]
      index_3 = wi[2]
      position_1 = @board[index_1]
      position_2 = @board[index_2]
      position_3 = @board[index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" 
        return wi
      elsif
        position_1 == "O" && position_2 == "O" && position_3 == "O"
          return wi
      end 
    end
    return false
  end
  
  def full?
    !@board.any?{|a| a.nil? || a == " " || a == ""}
  end
  
  def draw?
    !won? && full? ? true : false
  end
  
  def over?
    won? || full? || draw? ? true : false
  end
  
  def winner
    win = won?
    win ? @board[win[0]] : nil
  end
  
end