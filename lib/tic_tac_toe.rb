class TicTacToe

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

  def initialize(board=nil)
    @board = board || Array.new(9, " ")
  end

  def display_board
    print_spaces(@board[0],@board[1],@board[2])
    print_dash
    print_spaces(@board[3],@board[4],@board[5])
    print_dash
    print_spaces(@board[6],@board[7],@board[8])
  end

  def print_dash
    puts "-----------"
  end

  def print_spaces (val1, val2, val3)
    puts " #{val1} | #{val2} | #{val3} "
  end

  def input_to_index(input)
    return input.to_i - 1
  end

  def move(index,token)
    if valid_move?(index)
      @board[index]=token
      return true
    else
      return false
    end
  end

  def valid_move?(index)
    if !position_taken?(index) && index>=0 && index <=8
      return true
    else
      return false
    end
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    token = current_player
    if move(index,token)
      display_board
    else
      puts "This is not a valid move."
      turn
    end
  end

  def turn_count
    turn = 0
    @board.each do |space|
      if space != "" && space != " "
        turn +=1
      end
    end
    return turn
  end

  def current_player
    if turn_count%2==0
      return "X"
    else
      return "O"
    end
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if equality?(combo)
        return combo
      end
    end
    return nil
  end

  def equality?(combination)
    board_vals = []
    combination.each do |val|
      board_vals << @board[val]
    end
    if board_vals.all?{|space| space == "X"} || board_vals.all?{|space| space == "O"}
      return true
    else
      return false
    end
  end

  def full?
    if @board.none?{|val| val==""} && @board.none?{|val| val==" "}
      return true
    else
      return false
    end
  end

  def draw?
    if full? && !won?
      return true
    else
      return false
    end
  end

  def over?
    if full? || won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      return @board[won?[0]]
    else
      return nil
    end
  end

  def play
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    else won?
      puts "Congratulations #{winner}!"
    end
  end
end
