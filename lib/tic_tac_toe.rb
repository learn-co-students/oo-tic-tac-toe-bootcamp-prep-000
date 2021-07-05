class TicTacToe
  def initialize
    @board = Array.new(9," ")
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    index = input.to_i - 1
  end

  def move(index, player)
    @board[index] = "#{player}"
  end

  def position_taken?(index)
    if @board[index] != " "
      true
    else
      false
    end
  end

  def valid_move?(index)
    if index.between?(0,8) && !position_taken?(index)
      true
    else
      false
    end
  end

  def turn_count
    count = 0
    @board.each do |space|
      if space != " "
        count += 1
      end
    end
    return count
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    player = current_player
    if valid_move?(index)
      move(index, player)
      display_board
      # return @board
    else
      turn
    end
  end

  def won?
    positions = []
    winner = []
    WIN_COMBINATIONS.each do |winCombo| #iterate over each winning combination of the entire winning combinations array
      counter = 0
      winCombo.each do |index| #iterate over each element of each winning combo
        positions[counter] = @board[index] #pushes the element of the current board at the index based off the winning combination element
        counter += 1
      end
      if positions.all? {|position| position == "X"} #if all the board elements in the winning combo indexes are X, it's a win!
        return winCombo
      elsif positions.all? {|position| position == "O"} #same above but for O
        return winCombo
      end
    end
    return false #returns false after the function iterates through each winning combination
  end

  def full?
    @board.none?{|space| space == " "}
  end

  def draw?
    if full? && !won?
      return true
  else
      return false
    end
  end

  def over?
    if  won? || draw?
      return true
    else
      return false
    end
  end

  def winner
    if won?
      winCombo = won?
      index = winCombo[0]
      return @board[index]
    end
  end

  def play
    while !over?
      turn
    end
    if won?
      champ = winner
      puts "Congratulations #{champ}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # Bottom row
    [0,3,6],  # Left column
    [1,4,7],  # Middle column
    [2,5,8],  # Right column
    [0,4,8],  # Forward diagonal
    [2,4,6]  # Backward diagonal
  ]

end
