class TicTacToe
  
  def initialize(board = nil)
   @board = board || Array.new(9, " ")
  end


  WIN_COMBINATIONS = [
   [0,1,2], # Top row
   [3,4,5], # Middle row
   [6,7,8], # Bottom row
   [0,3,6], # First column
   [1,4,7], # Second column
   [2,5,8], # Third column
   [0,4,8], # Diagonal left to right
   [2,4,6], # Diagonal right to left
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


  def move(index, player_token = 'X')
    @board[index] = player_token
  end
 
 
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end


  def valid_move?(index)
    if !position_taken?(index) && index.between?(0, 8)
      return true
    else
     return false
    end
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
        turn
      end
  end
  
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end


  def current_player
   turn_count % 2 == 0 ? "X" : "O"
  end


  def won?
    WIN_COMBINATIONS.any? do |win_combination|
      if (@board[win_combination[0]]) == "X" && (@board[win_combination[1]]) == "X" && (@board[win_combination[2]]) == "X"
          return win_combination
      elsif (@board[win_combination[0]]) == "O" && (@board[win_combination[1]]) == "O" && (@board[win_combination[2]]) == "O"
          return win_combination
      else
          false
      end
    end
  end
  
  
  def full?
    @board.all? { |index| index == "X" || index == "O"}
  end


  def draw?
    full? && !won?
  end
  
  
  def over?
    won? || full?
  end
  
  
  def winner
    if won? != false
      return @board[won?.last]
    end
  end


  def play
    turn until over? || draw?

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end