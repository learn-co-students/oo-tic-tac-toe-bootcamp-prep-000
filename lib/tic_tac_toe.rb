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
  
  def input_to_index(input)
    index = input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
   
  def position_taken?(index)
    if @board[index] == " " || @board[index] == "" || @board[index] ==   nil
      false
    elsif @board[index] == "X" || @board[index] == "O"
      true
    end 
  end
  
  def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    end
  end
  
  def turn_count
    turns = 0
      @board.each do |position|
        if position == "X" || position == "O"
          turns += 1
        end
      end
    turns
  end
  
  def current_player
      if turn_count % 2 == 0
        token = "X"
        else
        token = "O"
      end
    token
  end

  def turn
  puts "Please enter 1-9:"
    input = gets.chomp
    index = input_to_index(input)
      if valid_move?(index)
        move(index, current_player)
        display_board
      else
        turn
      end
  end
  
  def won?
  WIN_COMBINATIONS.each do |win_combination|
    
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
 
  position_1 = @board[win_index_1]
  position_2 = @board[win_index_2]
  position_3 = @board[win_index_3]
 
  if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination
    end
  end
  false
end

def full?
  !@board.any? { |position| position == " "}
end

def draw?
  if full? && !won?
    true
  end
end

def over?
  if won? || full? || draw?
    true
  end
end

def winner
  if won?
    return @board[won?.first]
  end
end

def play
  turn until over?
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
end
  
end