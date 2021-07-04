class TicTacToe
  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5], # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  #1st col
    [1,4,7],  #2nd col
    [2,5,8],  #3rd col
    [0,4,8],  #diagonal R
    [2,4,6],  #diagonal L
  ]
  def initialize(board=nil)
    @board= Array.new(9," ")
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    if index<0 || index>8
      return false
    elsif position_taken?(index)
      return false
    end
    true
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
    WIN_COMBINATIONS.each do |(x,y,z)|
      if @board[x] == "X" && @board[y] == "X" && @board[z] == "X"
        return x,y,z # return the win_combination indexes that won.
      elsif @board[x] == "O" && @board[y] == "O" && @board[z] == "O"
        return x,y,z
      end
    end
    false
  end

  def full?
    @board.none?{|i| i==" "}
  end

  def draw?
    if won?
      return false
    else
      full?
    end
  end

  def over?
    if draw? || won?
      return true
    end
    false
  end

  def winner
    if won?
      x = won?
      return @board[x[0]]
    end
    nil
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(x)
   x.to_i-1
  end

  def move(ind, pla)
    @board[ind]=pla
  end

  def turn
    puts "Please enter 1-9"
    input = input_to_index(gets.strip)
    if !valid_move?(input)
      turn
    else
      move(input, current_player)
      display_board
    end
  end

  def play
    while !over? do
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
