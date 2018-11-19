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
   input.to_i - 1
  end
  
  def move(index, player_token)
    @board[index] = player_token
  end
  
  def position_taken?(index)
    space = @board[index]
    space != " " && space != "" && space != nil
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn_count
    counter = 0
    @board.each do |space|
      if space != " "
        counter += 1
      else 
      end
    end
    counter
  end
  
  def current_player
    if turn_count.even?
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?(index)
      player_token = current_player
      move(index, player_token)
      display_board
    else
      puts "Invalid Move"
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      
      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]
      
      position_1 == "X" && position_2 == "X" && position_3 == "X" ||
      position_1 == "O" && position_2 == "O" && position_3 == "O"
    end
  end
  
  def full?
    @board.none? do |character|
      character == " "
    end
  end
  
  def draw?
    full? && !won?
  end
  
  def over?
    draw? || won?
  end
  
  def winner
    if won? == nil
      nil
    else
      first_winning_space = won?[0]
      @board[first_winning_space]
    end
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
