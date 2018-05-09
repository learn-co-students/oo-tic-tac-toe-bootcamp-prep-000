class TicTacToe
def initialize(board=nil) 
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
  [0,1,2],[3,4,5],[6,7,8],  #horizontal
  [0,3,6],[1,4,7],[2,5,8],  #vertical
  [0,4,8],[2,4,6]           #diagonal
]


def input_to_index(input)
  @index = input.to_i - 1
  return @index
end

def position_taken?(index) #if pos is not nil or empty, it IS taken.
  !(@board[index] == nil || @board[index] == " ") ? true : false
end
def valid_move?(index)
  !index.between?(0,8) || position_taken?(index) ? false : true
end


def turn_count
  @board.count{|space| space == "X" || space == "O"}
end
def current_player
  turn_count.even? ? @player = "X" : @player = "O"
end


def move(index, player="X")
  @board[index] = player
  display_board
end

def won?
  holder = [] #nil, then 0,4,8
  WIN_COMBINATIONS.each do |combination| #for each combination
    @win_combination = combination #set the current array to the instance_var
    holder.push(@board[@win_combination[0]]) #0
    holder.push(@board[@win_combination[1]]) #4
    holder.push(@board[@win_combination[2]]) #8
    if holder.all?{|index| index =="X"} || holder.all?{|index| index =="O"}
      return @win_combination #this ends #won? entirely.
    end
    holder.clear #reset our holder.
  end #end iteration of WIN_COMBINATIONS

  @win_combination = false #if there's a winner, will never reach this line.
  return @win_combination 
  #if no combination was returned that means no winner so return false.
end #end won?

def winner
  if !over? #if the game is still going, nil
    return nil
  elsif @board[@win_combination[0]] == "X" 
    return "X"
  elsif @board[@win_combination[0]] == "O" 
    return "O"
  end
end

def full?
  @board.any?{|space| space == " " || space == nil} ? false : true 
end

def draw?
  if won? #if there's a winner, no draw.
    return false
  elsif full? #else if there's no winner, but the board is full
    return true
  else
    return false #if there's no winner and the board is not full, game is going.
  end
end

def over?
  if draw? || won? || full? #if there is a draw, win, or full board
    return true
  else
    return false
  end
end

def turn
  phrase = "Please enter 1-9:"
  puts phrase
  @index = input_to_index(gets.strip)
  if valid_move?(@index)
    move(@index, current_player)
  else
    turn
  end
end

def play
  until over?
    turn
  end
  
  if won?         #if over, check for a winner
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cat's Game!"
  end
end #end play
  
end #end Class