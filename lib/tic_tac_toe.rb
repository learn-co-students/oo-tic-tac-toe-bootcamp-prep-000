class TicTacToe
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
  
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
  
  def position_taken?(the_index)
    @board[the_index].strip != ""
  end

  def valid_move?(users_index)
    users_index.between?(0,8) && !position_taken?(users_index)
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    processed_input = input_to_index(input)
    if valid_move?(processed_input)
      move(processed_input, current_player)
      display_board
    else
      turn
    end
  end

  def turn_count
    @board.count{ |chip| chip == "X" || chip == "O" }
  end

  def current_player
    turn_count.even? ? "X" : "O" 
  end

  def won?
    result = false
    WIN_COMBINATIONS.each do |set|
      if @board[set[0]] == "X" && @board[set[1]] == "X" && @board[set[2]] == "X"
        result = set
        break
      elsif @board[set[0]] == "O" && @board[set[1]] == "O" && @board[set[2]] == "O"
        result = set
        break
      end
    end
    result
  end

  def full?
    filled = @board.all? do |spot|
      spot.strip != ""
    end
  end
  
  def draw?
    won? == false && full?
  end

  def over?
    won? != false || draw?
  end
  
  def winner
    outcome = won?
    if outcome != false
      @board[outcome[0]]
    else
      nil
    end
  end

  def play
    until over?
      turn
    end
    letter = winner
    if letter != nil
      puts "Congratulations #{letter}!"
    else
      puts "Cat's Game!"
    end
  end
end

