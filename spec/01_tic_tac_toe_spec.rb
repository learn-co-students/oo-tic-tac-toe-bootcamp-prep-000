class TicTacToe 
  
  # Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS=[
  [0,1,2],
  [0,4,8],
  [0,3,6],
  [1,4,7],
  [3,4,5],
  [2,4,6],
  [2,5,8],
  [6,7,8]
  ]
  
def initialize 
  @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  puts "Welcome to Tic Tac Toe!"
  display_board
end

def play
  until over?
    turn
  end#until
  if winner == "X"
    puts "Congratulations X!"
  elsif winner == "O"
    puts "Congratulations O!"
  else puts "Cat's Game!"
  end#if
end
  
def display_board
  puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
  puts "-----------"
  puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
  puts "-----------"
  puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
  index = input.to_i - 1
  #return index
end

def move(index, player="X")
  valid_move?(index) ? @board[index] = player : nil
    #return board
  #!(over?) ? turn : nil #<--------- turn now in #play loop
  #display_board(board)
end

def position_taken?(index)
  #!((board[index]==" ") || (board[index].to_s.empty?) || (board[index].nil?))
  !blank?(@board[index])
end

def valid_move?(index)
  index.between?(0,8) ? blank?(@board[index]) : nil
end

def turn 
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input.strip)
  playa = current_player
  move(index, playa) 
  display_board
end

def turn_count
  turn = 0
  @board.each{|place| blank?(place) ? nil : turn+=1}
  turn
end

def current_player
  turn_count.even? ? "X" : "O"
end

def won?
  #board.find{|combo| combo.all?{|position| (position=="X")||(position=="O")} ? combo : nil}
  WIN_COMBINATIONS.find{|combo| 
    combo.all?{|position| @board[position] == "X"} ||
    combo.all?{|position| @board[position] == "O"}
  } 
end #won

def full?
  @board.all?{|position| (position=="X")||(position=="O")}
end #full

def draw?
  full? ? 
                won? ? nil : TRUE
                : nil 
end #draw

def over?
  won?||full?||draw? 
end #over

def winner
  if !won?.nil?
  won?.all?{|position| @board[position] == "X"} ? "X" 
    : won?.all?{|position| @board[position] == "O"} ? "O" 
    : nil
  end#if
end #winner

def blank?(place)
  (place == " ") || (place.to_s.empty?) || (place.nil?)
end
  
end#class