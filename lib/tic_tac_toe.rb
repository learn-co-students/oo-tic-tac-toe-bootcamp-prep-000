class TicTacToe
  def initialize
    @board = Array.new(9, " ")
    puts "Welcome to TicTacToe!"
    display_board
  end 
  
  def board 
    @board 
  end 
  
  def display_board
    puts " #{board[0]} " "|" " #{board[1]} " "|" " #{board[2]} "
    puts "-----------"
    puts " #{board[3]} " "|" " #{board[4]} " "|" " #{board[5]} "
    puts "-----------"
    puts " #{board[6]} " "|" " #{board[7]} " "|" " #{board[8]} "
  end 
  
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]
    
  def input_to_index(user_input)
    user_input.to_i - 1
  end 
  
  def move(index, current_player)
    board[index] = current_player
  end
  
  def position_taken?(index)
    !(board[index].nil? || board[index] == " ")
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
    board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
     turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |array|
      if position_taken?(array[0]) == true && board[array[0]] == board[array[1]] && board[array[2]] == board[array[0]]
        return array 
      end
    end 
    return false
  end 
  
  def full?
    status = board.select{ |cell| cell == "X" || cell == "O" }
    if status.length == 9
      return true
    else 
      return false
    end 
  end 
  
  def draw?
    if full? == true && won? == false
      return true
    end
    return false 
  end
    
  def over?
    return draw? || won?  # returns draw?board. if draw?board is false, return won?board
  end
  
  def winner
    if won? != false
      return board[won?[0]]
    end
  end
  
  def play
    while !over?
      turn
    end
  
    if won?
      if winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    end
  
    if draw?
      puts "Cat's Game!"
    end
  end
  
end 