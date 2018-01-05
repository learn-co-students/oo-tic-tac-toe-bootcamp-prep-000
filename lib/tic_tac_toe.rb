class TicTacToe
  
  WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8],
   [0, 4, 8],
   [2, 4, 6]
  ]
  
  attr_accessor :board 
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end 
  
  def display_board
   row0 = @board[0..2].join(" | ")
   row1 = @board[3..5].join(" | ")
   row2 = @board[6..8].join(" | ")
  
   puts " " + row0 + " "
   puts "-----------"
   puts " " + row1 + " "
   puts "-----------"
   puts " " + row2 + " "
  end
  
  def input_to_index(input)
    input.to_i - 1 
  end 
  
  def move(index, mark)
    @board[index] = mark 
  end
  
  def position_taken?(index)
    marks = ["X", "O"]
    marks.any? {|mark| @board[index] == mark}
  end 
  
  def valid_move?(index)
    @board[index] == " " && (0..8).include?(index)
  end 
  
  def turn
    puts "Pick a number from 1-9: "
    input = gets.strip 
    index = input_to_index(input)
    
    until valid_move?(index)
      puts "Pick a number from 1-9: "
      input = gets.strip 
      index = input_to_index(input)
    end 
    
    mark = current_player
    
    move(index, mark)
    display_board
  end
  
  def turn_count
    @board.select {|spot| spot != " "}.count 
  end 
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end 
  
 def won?
  exs = []
  os = []
  
  @board.each_with_index do |spot, i|
    if spot == "X"
      exs << i
    elsif spot == "O"
      os << i
    end 
  end 
  
  result = []
  
  WIN_COMBINATIONS.each do |combo|
    if exs.length >= 3 && combo.all? {|num| exs.include?(num)}
      result << combo
    elsif os.length >=3 && combo.all? {|num| os.include?(num)}
      result << combo
    end  
  end 
  
  !result.empty? ? result[0] : false 
end 

def full?
  board_counts = what_we_have
  
  return true if board_counts[" "].nil? || draw?
  false 
end 

def draw?
  b_counts = what_we_have
  
  if won? != false 
    return false 
  elsif (b_counts["X"] == 4 && b_counts["O"] == 5) || (b_counts["X"] == 5 && b_counts["O"] == 4)
    return true
  end
  false 
end 

def over?
  return true if won? != false || draw? != false 
  false 
end 

def winner
  return nil if won? == false 
  winner_combo = won?
  
  board[winner_combo[0]]

end 

def what_we_have
  counter = Hash.new(0)
  
  @board.each do |elem|
    counter[elem] += 1 
  end 
  
  counter 
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