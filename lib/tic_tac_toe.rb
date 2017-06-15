class TicTacToe

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8], #bot row
    [0,4,8], #\ diag
    [2,4,6],  # / diag
    [0,3,6], #left col
    [1,4,7], #mid col
    [2,5,8] #right col
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

  def position_taken?(index) #returns true if there is a X or O at index, false if it's empty
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

  def turn_count
    counter = 0
    @board.each do |spot|
      if spot == "X" || spot == "O"
        counter += 1
      end
    end
    counter
  end

  def current_player
    player = turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      if @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
        if @board[combination[0]] == "X" || @board[combination[0]] == "O"
          return combination
        end
      end
    end
    return false
  end

  def full?
    @board.none?{|index|  index.nil? || index == " "}
  end

  def draw?
    full? && won? == false
  end

  def over?
    draw? || won? != false
  end

  def winner
    won = won?
    if won != false
      return @board[won[0]]
    else
      return nil
    end
  end

  def play
   until(over?)
     turn
   end
   if won? != false
     puts "Congratulations #{winner}!"
   elsif draw?
     puts "Cat's Game!"
   end
  end
end
