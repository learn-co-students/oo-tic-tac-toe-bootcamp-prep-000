class TicTacToe
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end 
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
  ]

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = @board[win_combination[0]]
      position_2 = @board[win_combination[1]]
      position_3 = @board[win_combination[2]]
      if position_1 == position_2 && position_1 == position_3 && position_1 != " " && position_1 != ""
        return win_combination
      end
    end
    return false
  end
  
  def draw?
    full? && !won?
  end 
  
  def over?
    won? || draw?
  end 
  
  def winner
    return won? ? @board[won?[0]] : nil
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def full?
    @board.all?{|position| (position == "X" || position == "O")}
  end 
  
  def input_to_index(user_input)
    return user_input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      token = current_player
      move(index, token)
      display_board
    else 
      puts "Please enter 1-9:"
      input = gets.strip
    end
  end
  
  def turn_count
    counter = 0
    @board.each do |index|
      (index == "X" || index == "O") ? counter += 1 : nil
    end
    return counter
  end
  
  def current_player
    token = (turn_count % 2 == 0) ? "X" : "O"
    return token
  end
  
  def play
    turn until over?
    
    puts won? ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end