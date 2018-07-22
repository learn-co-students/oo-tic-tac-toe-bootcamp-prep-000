require 'pry'
class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end




# WIN_COMBINATIONS within the body of TicTacToe
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
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

  def move(index, current_player )
    @board[index] = current_player
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

  # Define your play method below


  def turn_count
  count = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        count += 1
      end
    end
    return count
  end

  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.find do |sub|
      @board[sub[0]] == @board[sub[1]] && @board[sub[1]] == @board[sub[2]] && position_taken?(sub[0])
    end
  end

  def full?
     !@board.any? { |x| x == " "}
  end

  def draw?
    !won? && full?
  end

  def over?
    won? || draw?
  end

  def winner
    if winner = won?
      @board[winner.first]
    end
  end

  def play
    puts "You ready for some TIC TAC TOE??"
    turn until over?
    puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
  end
end
