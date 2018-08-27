class TicTacToe
  
  def initialize(board = nil)
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
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [6, 4, 2],
    [0, 4, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8]
    ]
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def move(index, current_player)
    @board[index] = current_player
  end
  
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please enter 1-9:"
    choice = input_to_index(gets.strip())
    if valid_move?(choice)
      move(choice, current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    occupied_spaces = 0 
    @board.each do |space|
      if (space != "" && space != " ")
        occupied_spaces +=1
      end
    end
    return occupied_spaces
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won? #return false if there are no winning combinations
      WIN_COMBINATIONS.each {|combination| 
        return combination if 
          combination.all? {|position| @board[position] == "X"} ||  combination.all? {|position| @board[position] == "O"}}
      return false
    end
  
    def full?
      @board.all? {|position| position == "X" || position == "O"}
    end
  
  def draw? #returns true if the board has not been won but is full
      return true if won? == false && full?
    end
    
    def over?
      draw? || won?
    end
    
    def winner
      return @board[won?[0]] if won?
    end
  
  def play
    until over? do
      turn
    end
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end