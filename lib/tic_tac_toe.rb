class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # Bottom row
    [0,3,6], # Columns
    [1,4,7],
    [2,5,8],
    [0,4,8], #diagonals
    [2,4,6]
  ] 
  
  @computerTurnCount = 1
  
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    @computerTurnCount = 1
  end
  
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
  
  def move(index, player) 
    @board[index] = player
    return @board
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
      turn
    end
  end
  
  def computer_turn
    puts "Computer's turn #{@computerTurnCount} ... thinking (or not)!"
    sleep(1)
    index = computerRandomChoice
    move(index, current_player)
    display_board
    @computerTurnCount += 1
  end
  
  def computerRandomChoice
    choice = Random.rand(0...9)
    while !valid_move?(choice) 
      choice = Random.rand(0...9)
    end
    return choice
  end
  
  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end
  
  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.detect {|combo| wins?(combo)}
  end
  
  def wins?(combo)
    combo.all? {|pos| @board[pos] == "X"} || combo.all? {|pos| @board[pos] == "O"}
  end

  def full?
    !(@board.include?(" "))
  end
  
  def draw?
    #returns false if the board is won
    if won?
      return false
    #returns true if the board has not been won and is full 
    elsif full? 
      return true
    #returns false if the board is not won and the board is not full
    else
      return false
    end
  end
  
  def over?
    won? || draw? || full?
  end
  
  def winner
    if (combo = won?)
      return @board[combo[0]]
    end
  end
  
  def play
    while !over?
      turn
    end
    if (winnee = winner)
      puts "Congratulations #{winnee}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
  def play_against_computer
    while !over?
      if current_player == "X"
        turn
      else
        computer_turn
      end
    end
    if (winnee = winner)
      puts "Congratulations #{winnee}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  
end #class