class TicTacToe
  def initialize
    @board = Array.new(9, " ")
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
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(input)
    input.to_i - 1
  end
  
  def move(index, token = "X")
    @board[index] = token
  end
  
  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end
  
  def valid_move?(index)
    index.between?(0,8) && position_taken?(index) == false
  end
  
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index) == false
      puts "Sorry, that is not a legal move."
      turn
    else
      move(index, current_player())
      display_board
    end
  end
  
  def turn_count
    count = 0
    @board.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
    end
    count
  end
  
  def current_player
    @current_player = (turn_count % 2).even? ? "X" : "O"
  end
  
  def won?
    #put all possible winning rows into a collection
    possible_wins = WIN_COMBINATIONS.select do |combo|
      combo.all? do |index|
        position_taken?(index)
      end
    end
    if possible_wins.empty?
      return false
    end
    #check if any combos are actually wins
    possible_wins.each do |pw|
      if (pw.all?{|i| @board[i] == "X"} || pw.all?{|i| @board[i] == "O"})
       return pw
      end
    end
    #return false if nothing has won
    return false
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
  
  def full?
    @board.all? do |position|
      !(position == " ")
    end
  end
  
  def over?
    won? || full? || draw? ? true : false
  end
  
  def winner
    if won?
      winning_combo = won?
      return @board[winning_combo[0]]
    else
      return nil
    end
  end
  
  def play
    display_board
    while !over?
      turn
    end
    if draw?
      puts "Cat's Game!"
    elsif won?
      puts "Congratulations #{winner}!"
    end
  end

end