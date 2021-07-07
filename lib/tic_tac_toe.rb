class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
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

    def move(index, player_token="X")
      @board[index] = player_token
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
  	  player_token = current_player
  	  if valid_move?(index)
  	    move(index, player_token)
  	    display_board
  	  else
  	    turn
  	  end
  end

  def turn_count
    counter = 0
    @board.each do |position|
      if position == "X" || position == "O"
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
    WIN_COMBINATIONS.each do |combo|
  	if  @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ||
        @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
  	  return combo
  	end
    end
    	return false
  end

  def full?
    if @board.detect {|i| i == "" || i == " "}
      return false
    else
      return true
    end
  end

  def draw?
    if won?
      return false
    elsif full?
      return true
    end
  end

  def over?
    if draw? || won?
      p "GAME OVER!"
      return true
    end
  end

  def winner
    if won? == false
      return nil
    end
  	var = @board[won?[0]]
    if var == "X"
  	  return "X"
    end
    if var == "O"
      return "O"
    end
  end

  def play
    until over?
      turn
    end
    if won?
      game_winner = winner
      puts "Congratulations #{game_winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end

end
