class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
    # Helper Method
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]
  
  def move (index, value)
    @board[index] = value
  end
  
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
  
  def valid_move?(index)
    index = index.to_i
    if (index.between?(0, 8))
      if (position_taken?(index))
        false
      else
        true
      end
    else
      false
    end
  end
  
  def position_taken? (position)
    if (@board[position] == "X" || @board[position] == "O")
      return true
    else
      return false
    end
  end
  
  def turn_count
    @board.select {|x| x != " "}.length
  end
  
  def current_player
    if(turn_count.even?)
      "X"
    else
      "O"
    end
  end

  def turn
  index = nil
  loop do
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    break if (valid_move?(index))
  end
  move(index, current_player)
  display_board
end

  def won?
    top_row_win = WIN_COMBINATIONS[0]
    middle_row_win = WIN_COMBINATIONS[1]
    bottom_row_win = WIN_COMBINATIONS[2]
    left_column_win = WIN_COMBINATIONS[3]
    middle_column_win = WIN_COMBINATIONS[4]
    right_column_win = WIN_COMBINATIONS[5]
    left_diagonal_win = WIN_COMBINATIONS[6]
    right_diagonal_win = WIN_COMBINATIONS[7]
    if (top_row_win.all? {|x| @board[x] == "X"} || top_row_win.all? {|x| @board[x] == "O"})
      top_row_win
    elsif (middle_row_win.all? {|x| @board[x] == "X"} || middle_row_win.all? {|x| @board[x] == "O"})
      middle_row_win
    elsif (bottom_row_win.all? {|x| @board[x] == "X"} || bottom_row_win.all? {|x| @board[x] == "O"})
      bottom_row_win
    elsif (left_column_win.all? {|x| @board[x] == "X"} || left_column_win.all? {|x| @board[x] == "O"})
      left_column_win
    elsif (middle_column_win.all? {|x| @board[x] == "X"} || middle_column_win.all? {|x| @board[x] == "O"})
      middle_column_win
    elsif (right_column_win.all? {|x| @board[x] == "X"} || right_column_win.all? {|x| @board[x] == "O"})
      right_column_win
    elsif (left_diagonal_win.all? {|x| @board[x] == "X"} || left_diagonal_win.all? {|x| @board[x] == "O"})
      left_diagonal_win
    elsif (right_diagonal_win.all? {|x| @board[x] == "X"} || right_diagonal_win.all? {|x| @board[x] == "O"})
      right_diagonal_win
    end
  end
  
  def full?
    if (@board.all? {|x| x != " "})
      true
    else
      false
    end
  end
  
  def draw?
    if (full? == true)
      if (!won?)
        true
      else
        false 
      end
    end
  end
  
  def over?
    if (draw? || won?)
      true
    else
      false 
    end
  end
  
  def winner
    if (won?)
      if (@board[won?[0]] == "X")
        "X"
      elsif (@board[won?[0]] == "O")
        "O"
      else
        nil
      end
    end
  end
  
  def play
    turns = 0 
    while (turns < 9 && !over?)
      turn
      turns += 1
    end
    if (winner == "X")
      puts "Congratulations X!"
    elsif(winner == "O")
      puts "Congratulations O!"
    elsif (draw?)
      puts "Cat's Game!"
    end
  end

end