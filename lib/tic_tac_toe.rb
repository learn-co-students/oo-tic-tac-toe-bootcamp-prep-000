class TicTacToe 
  
  WIN_COMBINATIONS = [
    [0,1,2], # row wins
    [3,4,5],
    [6,7,8],
    [0,3,6], # column wins
    [1,4,7],
    [2,5,8],
    [0,4,8], # diagonal wins
    [2,4,6]
  ]

  def initialize(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board = board
  end
  
  def board=(board)
    @board = board
  end
  
  def board
    @board
  end 
 
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, value) 
    @board[index] = value
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
      index.between?(0, 8) && !position_taken?(index)
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
    position_counter = 0
    @board.each do |position| 
      if position == "X" || position == "O" 
        position_counter += 1
      end
    end
    return position_counter
  end
  
  def current_player
    if turn_count.even?
      return "X"
    else
      return "O"
    end
  end
  
  def won? # returns winning combination
    WIN_COMBINATIONS.detect do |combo|
      combo.all? { |pos| @board[pos] == "X"} || combo.all? { |pos| @board[pos] == "O"}
    end
  end
  
  def full?
    @board.all? do |pos|
      pos == "X" || pos == "O"
    end
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won? # All objects have true boolean value - except false, nil 
      @board[won?.first]
    end
  end
  
  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    else draw?
      puts "Cat's Game!" 
    end
  end
  
end 