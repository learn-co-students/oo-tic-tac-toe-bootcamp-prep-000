class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  def play
    while (over? != true && draw? != true) # Checks to see if the game is over
      turn # Calls for another turn
    end
    if over? == true # If the game is over...
      if won? != false # If there's a winner and win_combo available
        puts "Congratulations #{winner()}!" # Samples win_combo and outputs "Congratulations X!" or "Congratulations O!" message
      elsif draw?
        puts "Cat's Game!"
      end
    end
  end


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

  def move(index, player_mark)
    @board[index] = player_mark
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def position_taken?(index)
    !(@board[index] == " " || @board[index] == "")
  end

  def turn_count
    cells_filled = 0
    @board.each do |cell|
      if (cell == "X" || cell == "O")
        cells_filled += 1
      end
    end
    return cells_filled
  end

  def current_player
    turns = turn_count()
    player = turns % 2 == 0 ? "X" : "O"
    return player
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      player_mark = current_player()
      move(index, player_mark)
      display_board()
    else
      turn()
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index1 = win_combo[0]
      win_index2 = win_combo[1]
      win_index3 = win_combo[2]

      if (@board[win_index1] == "X" && @board[win_index2] == "X" && @board[win_index3] == "X")
        return win_combo
      elsif (@board[win_index1] == "O" && @board[win_index2] == "O" && @board[win_index3] == "O")
        return win_combo
      end
    end
    if (@board.none? {|position| position == " " || position == "" || position == nil})
      return false
    elsif (@board == [" ", " ", " ", " ", " ", " ", " ", " ", " "] || @board == ["","","","","","","","",""]) #
      return false
    else
      return false
    end
  end

  def full?
    @board.all? do |position|
      position == "X" || position == "O"
    end
  end

def draw?
  if (won? == false && full? == true)
    return true
  else
    return false
  end
end

def over?
  if won? != false
    return true
  elsif full? == true
    return true
  end
end

def winner
  if won?
    win_combo = won?
    sample_index = win_combo[0]
    if @board[sample_index] == "X"
      return "X"
    elsif @board[sample_index] == "O"
      return "O"
    end
  end
  return nil
end


  WIN_COMBINATIONS = [
  [0, 1, 2], # Top row
  [3, 4, 5], # Middle row
  [6, 7, 8], # Bottom row
  [0, 3, 6], # Left vertical
  [1, 4, 7], # Middle vertical
  [2, 5, 8], # Right vertical
  [0, 4, 8], # Upper left diagonal
  [2, 4, 6] # Upper right diagonal
  ]

end
