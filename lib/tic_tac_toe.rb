class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
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
  
  def move(index, player_token)
    @board[index] = player_token
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    return !position_taken?(index) && index.between?(0,8)
  end
  
  def turn_count
    return @board.select{|c| c == "X" || c == "O"}.length
  end
  
  def current_player
    return turn_count%2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if position_taken?(combo[0]) &&
         position_taken?(combo[1]) &&
         position_taken?(combo[2]) &&
         @board[combo[0]] == @board[combo[1]] &&
         @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
    return false
  end
  
  def full?
    return !@board.any?{|c| c == " "}
  end
  
  def draw?
    return full? && !won?
  end
  
  def over?
    return won? || draw?
  end
  
  def winner
    if combo = won?
      return @board[combo[0]]
    end
    return nil
  end
  
  def turn
    puts "Please enter 1-9:"
    index = input_to_index(gets.strip)
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
    
    if w = winner
      puts "Congratulations #{w}!"
    else
      puts "Cat's Game!"
    end
  end
  
end