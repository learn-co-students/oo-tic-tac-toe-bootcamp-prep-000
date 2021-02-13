class TicTacToe
  
  def intialize
    @board = [" "," "," "," "," "," "," "," "," "]
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
  
  def move(index, token)
    @board[index] = token
  end
  
  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end
  
  def valid_move?(index)
    !position_taken?(index) && index.between(0,8)
  end
  
  def turn_count
    @board.count do |position|
      square != " "
    end
  end
  
  def current_player
    turn_count.even ? "X" : "O"
  end
  
  def turn
    puts "Put in a number between 1-9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?
      token = current_player
      move(index, token)
    else
      puts "Not a valid input"
      turn
    end
    display_board
  end
  
  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && position_taken?(@board[combo[0]])
    end
  end
  
  def full?
    @board.none? do |position|
      position == " "
    end
  end
  
  def draw?
    full? && !won?
  end
  
  def over? 
    draw? || won?
  end
  
  def winner
    winning_combo = won?
    winning_token = @board[winning_combo[0]]
    winning_token
  end
  
  def play
    until over?
      turn
    end
    if draw?
      puts "Its a draw"
    else
      puts "#{winner} wins!!"
  end
end 