class TicTacToe
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end

  # Helper Method
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  # Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

  def won?
    winning_combo = nil
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[0]] == @board[combo[2]] && @board[combo[0]] != " "
        return winning_combo = combo
      end
    end
    winning_combo
  end

  def full?
    @board.detect{|i| i == " "} == nil
  end

  def draw?
    full? && !won?
  end

  def over?
    full? || won? || draw?
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def turn_count
    counter = 0
    @board.each do |tile|
      if tile != " "
        counter+= 1
      end
    end
    counter
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  # Helper Methods
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

  def move(index, current_player)
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
      puts "This is not a valid move."
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    end
    if draw?
      puts "Cat's Game!"
    end
  end
end
