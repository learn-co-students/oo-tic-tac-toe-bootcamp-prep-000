class TicTacToe
  
  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,4,8],
    [2,4,6],
    [0,3,6],
    [1,4,7],
    [2,5,8]
  ]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end 

  def input_to_index(input)
    input.to_i-1
  end

  def move(index, player="X")
    @board[index] = player
    return @board
  end

  def position_taken?(index)
    if @board[index]==" "
      false
    else
      true
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && index.between?(0,8)
      true
    else
      false
    end
  end

  def turn
    puts "Please enter 1-9:"
    input=input_to_index(gets.strip)
    if valid_move?(input)
      move(input, current_player)
      display_board
    else
      puts "Please try again with 1-9:"
      turn
    end
  end

  def turn_count
    filledBoard = 0
    @board.each do |turn|
      if (turn == "X" || turn == "O")
        filledBoard+=1
      end
    end
    return filledBoard
  end

  def current_player
    if turn_count % 2 == 0 
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |win|
      index_1 = win[0]
      index_2 = win[1]
      index_3 = win[2]
      
      position_1 = @board[index_1]
      position_2 = @board[index_2]
      position_3 = @board[index_3]
      
      if (position_1 == "X" && position_2 == "X" && position_3 == "X")||(position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win
      else
        false
      end
    end
  end

  def full?
    @board.all? do |move|
      move == "X" || move == "O"
    end
  end

  def draw?
    if !won? && full?
      true
    else
      false
    end
  end

  def over?
    if won? || (!won? && full?) || full?
      true
    else
      false
    end
  end

  def winner
    winningCombo = won?
    if winningCombo
      if winningCombo.any? {|win| @board[win] == "X"}
        return "X"
      else 
        return "O"
      end
    end
  end 

  def play
    if won?
      puts "Congratulations " + winner + "!"
    elsif draw?
      puts "Cat's Game!"
    elsif !(over?)
      turn
      play
    end
  end
  
end