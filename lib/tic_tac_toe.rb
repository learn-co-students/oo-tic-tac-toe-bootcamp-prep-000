class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  WIN_COMBINATIONS = [
  [2,4,6],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [0,3,6],
  [0,1,2],
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
    return input.to_i - 1
  end
  def move(index, mark)
    @board[index] = mark
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
    if valid_move?(index)
      mark = current_player
      move(index, mark)
      display_board
    else
      turn
    end
  end
  def turn_count
    turn_num = 0
    @board.each do |space|
      if space == "X" || space == "O"
        turn_num += 1
      end
    end
    return turn_num
  end
  def current_player
    if turn_count.even? 
      return "X"
    else
      return  "O"
    end
  end
  def won?
    WIN_COMBINATIONS.each do |combo|
      if combo.all? {|space| @board[space] == "X"}
        return combo
      elsif combo.all? {|space| @board[space] == "O"}
        return combo
      end
    end
    return FALSE
  end
  def full?
    if @board.all? {|space| space == "X" || space == "O"}
      return TRUE
    else
      return FALSE
    end
  end
  def draw?
    if won? == FALSE && full? == TRUE
      return TRUE
    else
      return FALSE
    end
  end
  def over?
    if won? != FALSE || draw? == TRUE
      return TRUE
    else
      return FALSE
    end
  end
  def winner
    if won? != FALSE
      return @board[won?[0]]
    end
  end
  def play
    until over?
      turn
    end
    if draw? == TRUE
      puts "Cat's Game!"
    else 
      puts "Congratulations #{winner}!"
    end
  end
end 