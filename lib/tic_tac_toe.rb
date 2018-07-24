class TicTacToe

  def initialize (board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @board= board
  end

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]

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

  def move(index, player_token)
    @board[index] = player_token
  end

  def position_taken?(index)
    @board[index] == "X" || @board[index] == "O"
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
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
    turn_count % 2 == 0? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, player_token = current_player)
      display_board
    else
      puts "Invalid"
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      return combo if (@board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X" ||
      @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O" )
    end
    false if @board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def full?
    true if @board.none?{|i| i == " "}
  end

  def draw?
    true if full? && !won?
  end

  def over?
    true if draw? || won? || full?
  end

  def winner
    if won?
      win_array = won?
      return @board[win_array[0]]
    end
  end

  def play
    while !over?
      turn
    end
    puts "Congratulations #{winner}!"
    puts "Cat\'s Game!"
  end

end
