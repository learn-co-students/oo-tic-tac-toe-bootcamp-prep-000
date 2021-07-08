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

  
  
  def input_to_index(x)
  index = x.to_i-1
  end
  
  def move(index, character)
    @board[index] = character
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    character = current_player
    index = input_to_index(input)
    if valid_move?(index)
      move(index, character)
      display_board
    else
      turn
    end
  end

  def turn_count
    turn_number = 0
  
    @board.each do |board_number|
      if (board_number != "" && board_number != " " && board_number != nil)
        turn_number += 1
      end
  end
    return turn_number
  end
  
  def won?
  WIN_COMBINATIONS.each do |win_combination|
    if (@board[win_combination[0]] == "X" && @board[win_combination[1]] == "X" && @board[win_combination[2]] == "X") || (@board[win_combination[0]] == "O" && @board[win_combination[1]] == "O" && @board[win_combination[2]] == "O")

      return win_combination
    end
  end
  return false
 end

 def full?
   @board.each_with_index do |character, index|
     if !position_taken?(index)
       return false
     end
   end
   return true
 end

 def draw?
  if !won?
    if full?
      return true
    end
  else
    return false
  end
end

def over?
  if won? || draw? || full?
    return true
  else
    return false
  end
end

def winner
  x = won?
  if won?
    return @board[x[0]]
  end
end

def play
   while over? == false
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
  
end

end
