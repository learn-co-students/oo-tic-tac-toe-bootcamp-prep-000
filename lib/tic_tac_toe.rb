class TicTacToe
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
  
  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end
  
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
  
  def move(index, char="X")
    @board[index] = char
  end
  
  def position_taken?(index)
    @board[index] != " " && @board[index] != nil
  end
  
  def valid_move?(index)
    (0..8).include?(index) && !position_taken?(index)
  end
  
  def turn_count
    @board.select do |element|
      element != " " && element != nil
    end.count
  end
  
  def current_player
    if turn_count % 2 == 0
      "X"
    else
      "O"
    end
  end
  
  def turn
    puts "Select a position from 1-9"
    input = gets.strip
    index = input_to_index(input)
    
    if valid_move?(index)
      char = current_player
      move(index, char)
      display_board
    else
      turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]] && @board[combo[0]] != " " && @board[combo[0]] != nil
        return combo
      end
    end
    false
  end
  
  def full?
    @board.all? do |index|
      index != " " && index != nil
    end
  end
  
  def draw?
    !won? && full?
  end
  
  def over?
    won? || draw?
  end
  
  def winner
    if won?
      @board[won?[0]]
    end
  end

  def play
    turn until over?
    
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end
  
end