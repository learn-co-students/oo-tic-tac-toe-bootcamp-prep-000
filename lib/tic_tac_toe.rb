class TicTacToe
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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
  
  def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

 #board = [" "," "," "," "," "," "," "," "," "]

def input_to_index(user_input)
  user_input.to_i - 1
end

def move(index, value = "X")
  @board[index] = value
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
  index = input_to_index(input)
  if valid_move?(index)
    move(index, current_player)
    display_board
  else
    turn
  end
end
 
def turn_count
  count = 0
  @board.each do |entry|
    if entry != " "
      count += 1
    end
  end
  return count
end

def current_player
  if turn_count % 2 == 0
    return "X"  
  else
    return "O"
  end
end 

def won?
    WIN_COMBINATIONS.find do |winning_combo|
    win_index_1 = winning_combo[0]
    win_index_2 = winning_combo[1]
    win_index_3 = winning_combo[2]
     
    position_1 = @board[win_index_1]
    position_2 = @board[win_index_2]
    position_3 = @board[win_index_3]
     
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
       winning_combo
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
       winning_combo
     end
    end
  end
  
  def full?
    @board.all? do |full|
      if full == " "
        false
      else
        true
      end
    end
  end
  
  def draw?
    if !won? && full?
      return true
    else
      return false
    end
  end
  
  def over?
    if won? || draw?
      return true
    end
  end

  def winner 
    if   won?
      return @board[won?[0]]
    else
      return nil
    end
  end
    
    def play
      until over? do 
        turn
      end
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end
    end
end