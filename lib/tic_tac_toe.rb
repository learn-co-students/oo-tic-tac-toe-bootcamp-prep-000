class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," ",]
  end

  WIN_COMBINATIONS = [
    [0,1,2], #top row
    [3,4,5], #middle row
    [6,7,8], #bottom row
    [0,3,6], #left column
    [1,4,7], #middle column
    [2,5,8], #right column
    [0,4,8], #topltr diagnal
    [2,4,6] #toprtl diagnal
  ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player = "X")
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
    counter = 0
    @board.each do |ele|
      if ele == "X" || ele == "O"
        counter += 1
      end
    end
    return counter
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end 

  def won?
    WIN_COMBINATIONS.detect do |combo|
      (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X") ||
      (@board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O")
      end
    end
    
  def full?
    @board.all? do |index|
      index == "X" || index == "O"
    end
  end
  
  def draw?
    if (!won? && full?)
        return true
    else
      return false
      end
    end
    
  def over?
    if (won? || draw? || full?)
      return true
    else
      return false
    end
  end
  
  def winner
    if(won?)
      winning_combo = won?
      return @board[winning_combo[0]]
    end
  end
  
  def play
    until over?
      turn
    end
    if winner != nil
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  
end