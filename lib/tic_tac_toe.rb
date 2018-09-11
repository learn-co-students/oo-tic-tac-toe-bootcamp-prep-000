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

  def input_to_index(number)
    index = number.to_i - 1
  end
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
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
      puts "That is not a valid move, please try again."
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.each do |cell|
      if cell == "X" || cell == "O"
        count += 1 
      end
    end
    count
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      position_taken?(win_combination[0]) == true && @board[win_combination[0]] == @board[win_combination[1]] && @board[win_combination[1]] == @board[win_combination[2]]
    end
  end
  
  def full?
    [0,1,2,3,4,5,6,7,8].all?{|index| position_taken?(index)}
  end
  
  def draw?
    won?.nil? && full? == true
  end
  
  def over?
    !won?.nil? || draw? == true
  end
  
  def winner
    if won?.nil?
      nil
    else
      @board[won?.detect{|index| position_taken?(index)}]
    end
  end
  
  def play
    until over?
      turn
      if won?
        puts "Congratulations #{winner}!"
      elsif draw?
        puts "Cat's Game!"
      end 
    end
    won?
    puts "Congratulations X!"
    won?
    puts "Congratulations O!"
    won?
    puts "Cat's Game!"
  end

end