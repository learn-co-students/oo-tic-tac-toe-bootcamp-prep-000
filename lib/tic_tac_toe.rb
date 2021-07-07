class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
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

  def input_to_index(user_in)
    return (user_in.to_i) - 1
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def move(space, mark)
    @board[space] = mark
  end

  def position_taken?(space)
    if (@board[space] == "X" || @board[space] == "O")
      return true
    else
      return false
    end
  end

  def valid_move?(space)
    if (space < 0 || space > 8)
      return false
    elsif position_taken?(space)
      return false
    else
      return true
    end
  end

  def turn_count
    @board.count{|space| space == "X" || space == "O"}
  end

  def turn
    puts "Please enter 1-9:"
    choice = input_to_index(gets.strip)
    puts choice
    if valid_move?(choice)
      move(choice, current_player)
      display_board
    else
      display_board
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.detect do |combo|
      @board[combo[0]] == @board[combo[1]] &&
      @board[combo[1]] == @board[combo[2]] &&
      (@board[combo[2]] == "X" || @board[combo[1]] == "O")
    end
  end

  def full?
    @board.all? do |space|
      (space == "X" || space == "O")
    end
  end

  def draw?
    return (full? && !(won?)) ? true : false
  end

  def over?
    return (won? || draw?) ? true : false
  end

  def winner
    if winnar = won?
      @board[winnar.first]
    else
      return nil
    end
  end

  def play
    until over?
      turn

    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

end
