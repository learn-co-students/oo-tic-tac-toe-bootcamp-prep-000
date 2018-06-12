class TicTacToe
  
  def initialize
    @board = Array.new(9," ")
  end
  
  WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8], # right column
  [0,4,8], # up-down diagonal
  [6,4,2]  # down-up diagonal
  ]
  
    def display_board
    puts " "
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    puts " "
  end

  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    @board[index] != " " && @board[index] != ""
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
    @board.count { |a| a == "X" || a ==  "O" }
  end

  def current_player
    if turn_count % 2 == 1
      return "O"
    else  
    return "X"
    end
  end



  def play
    while !over?
      turn
    end
  
    if winner 
      puts "#{winner} won the game!"
    elsif draw?
      puts "Cat's Game!"
    end 

    replay?
  end

  def replay?
    puts "Play again [Y/n]? "
    choice = gets.strip
    if choice[0].upcase == "Y"
      @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      display_board
      play
    else
      exit
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do | win_combo |
      board_values = @board.values_at(*win_combo)
      if board_values.all? { |a| a == "X" } || board_values.all? { |a| a == "O" }
        return win_combo
      end
    end
    false
  end

  def full?
    true if @board.all? { |a| a == "X" || a == "O" }
  end

  def draw?
    true if full? && !won?
  end

  def over?
    true if full? || won? || draw?
  end

  def winner
    if won? then
      return @board[won?[0]]
    end
  end

end
