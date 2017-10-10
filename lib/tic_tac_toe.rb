class TicTacToe
  WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 3, 6], #top column
  [1, 4, 7], #middle column
  [2, 5, 8], #right column
  [0, 4, 8], #top left diagonal
  [2, 4, 6], #top right diagonal
  ]
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display_board()
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  def input_to_index(user_input)
    user_input.to_i - 1
  end

  def move(index, currPlayer)
    @board[index] = currPlayer
  end

  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  def turn_count
    counter = 0
    @board.each do |currPos|
      if currPos == "X" || currPos == "O"
        counter+=1
      end
    end
    return counter
  end

  def current_player
    if turn_count() % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  def turn
    currLetter = current_player()
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, currLetter)
      display_board()
    else
      turn()
    end
  end
  def won?
    WIN_COMBINATIONS.each do |winPos|
      if @board[winPos[0]] == "X" && @board[winPos[1]] == "X" && @board[winPos[2]] == "X"
        return winPos
      end
      if @board[winPos[0]] == "O" && @board[winPos[1]] == "O" && @board[winPos[2]] == "O"
        return winPos
      end
    end
    return false
  end
  def full?
    @board.all? do |section|
      section == "X" || section == "O"
    end
  end
  def draw?
    if full?()
      if won?() == false
        return true
      end
    end
    return false
  end
  def over?
    if draw?() || won?()
      return true
    else
      return false
    end
  end

  def winner
    if won?()
      winningBoard = won?()
      #puts("winning board is #{winningBoard}")
      if @board[winningBoard[0]] == "X"
        return "X"
      else
        return "O"
      end
    else
      return nil
    end
  end

  def play
    until over?() do
      turn()
    end
    if won?()
      puts "Congratulations #{winner()}!"
    else
      puts "Cat's Game!"
    end
  end

end
