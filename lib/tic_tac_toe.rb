class TicTacToe
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    index = input.to_i
    if !index 
      return -1
    else
      return index -= 1
    end
  end
  
  def move(index, position="X")
    @board[index] = position
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    if index>= 0 && index <=8
      if position_taken?(index) == false
        return true
      else return false
      end
    else return false
    end
  end
  
  def turn
    puts "Please enter 1-9:"
    goodInput = false
    while goodInput == false
      input = gets.strip
      index = input_to_index(input)
      if valid_move?(index) == true && position_taken?(index) == false
        move(index, current_player)
        goodInput = true
        display_board
      else 
        puts "Not a valid move! Try again"
      end
    end
  end
  
  def turn_count
    xTurnsTaken = 0
    oTurnsTaken = 0
    @board.each do |space|
      if space == "X"
        xTurnsTaken += 1
      elsif space == "O"
        oTurnsTaken += 1
      end
    end
    turnsTaken = xTurnsTaken + oTurnsTaken
  end
  
  def current_player
    turnToGo = turn_count
    if turnToGo%2 == 0
      return "X"
    else
      return "O"
    end
  end
  def won?
    WIN_COMBINATIONS.each do |win_combo|
      index0 = win_combo[0]
      index1 = win_combo[1]
      index2 = win_combo[2]
      if @board[index0] == "X" && @board[index1] == "X" && @board[index2] == "X"
        return win_combo
      elsif @board[index0] == "O" && @board[index1] == "O" && @board[index2] == "O"
        return win_combo
      end
    end
    return false
  end
  def full?
    count = -1
    check = @board.all? do |i|
      count += 1
      position_taken?(count)
    end
    check
  end
  def draw?
    if won?
      return false
    elsif full?
      return true
    else
      return false
    end
  end
  
  def over?
    if full? || draw? || won? != false
      return true
    else return false
    end
  end
  
  def winner
    if won? != false
      winningCombo = won?
      teamWin = @board[winningCombo[0]]
      return teamWin
    else return nil
    end
  end
  
  def play
    while !(over?)
      turn
      won?
    end
    if won? != false
      winnerTeam = winner
      puts "Congratulations #{winnerTeam}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end












