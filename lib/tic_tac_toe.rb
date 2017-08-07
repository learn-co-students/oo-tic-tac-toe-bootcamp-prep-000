class TicTacToe
  def initialize(t_board = nil)
    @board = t_board || Array.new(9, " ")
  end
  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8], # last row
    [0,3,6], # Left row
    [1,4,7], # Middle vertical row
    [2,5,8], # Right row
    [0,4,8], # Top left to bottom right cross
    [2,4,6] # Bottom left to top right cross
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

  def move(index, current_player)
    @board[index] = current_player
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index.between?(0,8)
      return !position_taken?(index)
    end
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
  # *******************************
  def turn_count
    count = 0;
    board.each do |square|
      if square == "X" || square == "O"
        count +=1
      end
    end
    return count #return number of turns that have been played
  end

  # *******************************
  def current_player
    value = turn_count % 2 == 0 ? "X" : "O"
  end

  # *******************************
  def won?
    WIN_COMBINATIONS.each do |combo|
      if position_taken?(combo[0]) && position_taken?(combo[1]) && position_taken?(combo[2])
        if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
          return combo
        end
      end #if
    end #WIN_COMBINATIONS
    return nil
  end

  # *******************************
  def full?
    (@board.select{|position| position== "X" || position=="O"}).length >= 9
  end

  # *******************************
  def draw?
    draw = won?.nil?   && full?
  end

  # *******************************

  def over?
    over = !(won?.nil?) || draw? || full?
  end

  # *******************************
  def full?
    (@board.select{|position| position== "X" || position=="O"}).length >= 9
  end

  # *******************************
  def winner
    winning_combo = won?
    if winning_combo.nil?
      return winning_combo
    end
    token = @board[winning_combo[0]]
  end

  # *******************************
  def play
    until over? # until the game is over
      turn#   take turns
    end # end over
    if won?# if the game was won
      puts "Congratulations #{winner}!"#   congratulate the winner
    elsif draw?# else if the game was a draw
      puts "Cat's Game!"#   tell the players it has been a draw
    end
  end

  # *******************************

end #class
x = TicTacToe.new

puts x.board.length
puts x.board.class
puts x.display_board
# puts x.WIN_COMBINATIONS
 # x.board
